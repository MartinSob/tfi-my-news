﻿using BusinessEntity;
using Persistence.Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
	public class EmployeeBl
	{
		EmployeeDao dao = new EmployeeDao();

		public Employee create(Employee employee) {
			dao.create(employee);
			return employee;
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public List<Employee> get(string name = null, bool showOld = false) {
			return dao.get(name, showOld);
		}

		public List<User> getUsersNotEmployed(string name) {
			return dao.getUsersNotEmployed(name);
		}

		public Employee get(int id) {
			return dao.get(id);
		}

		public void update(Employee employee) {
			dao.update(employee);
		}
	}
}
