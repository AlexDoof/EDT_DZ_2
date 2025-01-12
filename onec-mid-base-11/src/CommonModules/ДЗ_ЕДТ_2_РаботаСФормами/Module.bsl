#Область ПрограмныйИнтерфейс       

Процедура ДозаполнитьФорму(Форма) Экспорт 
	ИмяФормы = Форма.ИмяФормы;
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
		ДобавлениеСогласованнаяСкидкаИпересчетДанных(Форма); 
		ДобавлениеКомандыИКнопкиПересчетДанныхСУчетомСкидки(Форма); 
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);  
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
	КонецЕсли;
КонецПроцедуры

#КонецОбласти     

#Область СлужебныйПрограмныйИнтерфейс

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)   
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо",Тип("ПолеФормы"),Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_ЕДТ_2_КонтактноеЛицо";
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма) 
	Если Форма.ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо",Тип("ПолеФормы"),, Форма.Элементы.Основание);
	Иначе
		ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо",Тип("ПолеФормы"),, Форма.Элементы.СуммаДокумента);
	КонецЕсли;
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_ЕДТ_2_КонтактноеЛицо"; 
КонецПроцедуры     

Процедура ДобавлениеСогласованнаяСкидкаИпересчетДанных(Форма)  
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка",Тип("ПолеФормы"),Форма.Элементы.ГруппаШапкаЛево);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_ЕДТ_2_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "ПриИзмененииСкидки");
КонецПроцедуры   

Процедура ДобавлениеКомандыИКнопкиПересчетДанныхСУчетомСкидки(Форма)  
	Команда = Форма.Команды.Добавить("ПересчитатьСоСкидкой");	
	Команда.Заголовок = "Пересчитать с учетом скидки";
	Команда.Действие  = "КомандаПересчитатьСоСкидкой"; 
	КнопкаФормы = Форма.Элементы.Добавить("КнопкаПересчитатьСоСкидкой", Тип("КнопкаФормы"),Форма.Элементы.ГруппаШапкаЛево);
	КнопкаФормы.ИмяКоманды =  "ПересчитатьСоСкидкой";
КонецПроцедуры

#КонецОбласти