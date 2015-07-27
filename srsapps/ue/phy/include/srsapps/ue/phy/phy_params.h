/**
 *
 * \section COPYRIGHT
 *
 * Copyright 2013-2015 The srsLTE Developers. See the
 * COPYRIGHT file at the top-level directory of this distribution.
 *
 * \section LICENSE
 *
 * This file is part of the srsLTE library.
 *
 * srsLTE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * srsLTE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * A copy of the GNU Affero General Public License can be found in
 * the LICENSE file in the top-level directory of this distribution
 * and at http://www.gnu.org/licenses/.
 *
 */



#include "srslte/srslte.h"
#include "srsapps/common/params_db.h"
#include "srsapps/common/phy_interface.h"

#ifndef PHYPARAMS_H
#define PHYPARAMS_H


namespace srslte {
namespace ue {

  class phy_params : public params_db
  {
  public: 

    phy_params() : params_db(phy_interface_params::NOF_PARAMS) { }
   ~phy_params() {}
    
    
  };
}
}

#endif