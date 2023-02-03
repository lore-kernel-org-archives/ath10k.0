Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C8C61DA4
	for <ath10k@archiver.kernel.org>; Fri,  3 Feb 2023 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9roFACCaEzlUWKHFRVRKGZnWyEqE27SxC8/lJj45+7c=; b=UchmdkA3d5eDyz
	mu25qgp4aStQvsb5uxWK66DYaKJEydr9ogzdgTqLiOym3/zSX2O0SxKz5rRFn0VtD94TPGPrBbzjN
	vfbwZftfvXrXh4ihMTLhWEJJQ1vVQAYJ1Any8xnsbyca56TT3I7APozU1ejHkaQbaHPsQCv1sriv/
	2FfERN+Dn6OJCiVHWtbl7yC4kBr6V2jRMPY+7hxcfkSvH/DQ3/mVaBVA2cBNrtJ10aYZv3ZQdpsgo
	oRFyySTLpw2g8n9EaEartZDMH4UQ9tw3d8paDw4GMmzHzzKrWVlefGVa9+VRkklFGw9WvKCZXLAB3
	evBU9SbxrCx+oO5df5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNuPM-001cTZ-3A; Fri, 03 Feb 2023 11:39:08 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNuPJ-001cS9-5N
	for ath10k@lists.infradead.org; Fri, 03 Feb 2023 11:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675424345; x=1706960345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4IwlRkDcHwHBKdH4tsEJMEjumxbzdWvfwZJP6tuNYlA=;
  b=Zf4qMe2eDZwzn118g7AvbVn/rLiib/W73sLvPOkGHHIA61Vo10mQiC27
   PI/7hYaAqio5PQEEdObnm6AZcPbdHoybXkfNF7qhv5EfbntookI8Y/6m6
   OEiRI/v+Ln4JU12K08cQ0o1P+N6a10iuC0isRATUvMycjPuileD/6UwEh
   B6FnCHcnezBuYvVAey/+sK2/HlWybLelcsd9Oucn7ix2qX02mLVRl/wfo
   6hIEmmfIrdhHUINjo/wwy+f+uGU5DwFu2v6tk3Hf7GpU+eVqa6Bsgcxy8
   nhJc9DLKSN+cYU3cwcB/oZ8vy8kMLL61KlMwDGhHWlsNH0gxsE/MuRUSa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330012837"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="330012837"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 03:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994497039"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="994497039"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 03:38:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNuPB-0000Rf-0s;
	Fri, 03 Feb 2023 11:38:57 +0000
Date: Fri, 3 Feb 2023 19:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: equu@openmail.cc, lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	robh@kernel.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, equu@openmail.cc,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] wifi: ath10k: only load compatible DT cal data
Message-ID: <202302031943.aLVT61nB-lkp@intel.com>
References: <20230202075524.2911058-4-equu@openmail.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202075524.2911058-4-equu@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_033905_282679_1F2E09D5 
X-CRM114-Status: GOOD (  16.97  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on helgaas-pci/for-linus wireless-next/main wireless/main linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/equu-openmail-cc/wifi-ath9k-stop-loading-incompatible-DT-cal-data/20230202-165536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
patch link:    https://lore.kernel.org/r/20230202075524.2911058-4-equu%40openmail.cc
patch subject: [PATCH v3 3/3] wifi: ath10k: only load compatible DT cal data
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230203/202302031943.aLVT61nB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d2ef9bc195ade55c010e64762b135a46a62f3fdd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review equu-openmail-cc/wifi-ath9k-stop-loading-incompatible-DT-cal-data/20230202-165536
        git checkout d2ef9bc195ade55c010e64762b135a46a62f3fdd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/ath/ath10k/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath10k/core.c:16:
   include/linux/of_pci.h:23:33: warning: 'struct pci_driver' declared inside parameter list will not be visible outside of this definition or declaration
      23 |                          struct pci_driver *drv);
         |                                 ^~~~~~~~~~
   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_download_cal_nvmem':
>> drivers/net/wireless/ath/ath10k/core.c:1987:40: error: passing argument 2 of 'of_pci_node_match_driver' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1987 |                                        &ath10k_pci_driver)))
         |                                        ^~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct pci_driver *
   In file included from drivers/net/wireless/ath/ath10k/core.c:16:
   include/linux/of_pci.h:23:45: note: expected 'struct pci_driver *' but argument is of type 'struct pci_driver *'
      23 |                          struct pci_driver *drv);
         |                          ~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/of_pci_node_match_driver +1987 drivers/net/wireless/ath/ath10k/core.c

  1955	
  1956	static int ath10k_download_cal_nvmem(struct ath10k *ar, const char *cell_name)
  1957	{
  1958		struct nvmem_cell *cell;
  1959		void *buf;
  1960		size_t len;
  1961		int ret;
  1962	
  1963		/* devm_nvmem_cell_get() will get a cell first from the OF
  1964		 * DT node representing the given device with nvmem-cell-name
  1965		 * "calibration", and from the global lookup table as a fallback,
  1966		 * and an ath10k device could be either a pci one or a platform one.
  1967		 *
  1968		 * If the OF DT node is not compatible with the real device, the
  1969		 * calibration data got from the node should not be applied.
  1970		 *
  1971		 * dev_is_pci(ar->dev) && ( no OF node || caldata not from node
  1972		 * || not compatible ) -> do not use caldata .
  1973		 *
  1974		 * !dev_is_pci(ar->dev) -> always use caldata .
  1975		 *
  1976		 * The judgement for compatibility differs with ath9k for many
  1977		 * DT using "qcom,ath10k" as compatibility string.
  1978		 */
  1979		if (dev_is_pci(ar->dev) &&
  1980		    (!ar->dev->of_node ||
  1981		     (of_property_match_string(ar->dev->of_node,
  1982					       "nvmem-cell-names",
  1983					       cell_name) < 0) ||
  1984		     !of_device_is_compatible(ar->dev->of_node,
  1985					      "qcom,ath10k") ||
  1986		     !of_pci_node_match_driver(ar->dev->of_node,
> 1987					       &ath10k_pci_driver)))
  1988			return -ENOENT;
  1989	
  1990		cell = devm_nvmem_cell_get(ar->dev, cell_name);
  1991		if (IS_ERR(cell)) {
  1992			ret = PTR_ERR(cell);
  1993			return ret;
  1994		}
  1995	
  1996		buf = nvmem_cell_read(cell, &len);
  1997		if (IS_ERR(buf))
  1998			return PTR_ERR(buf);
  1999	
  2000		if (ar->hw_params.cal_data_len != len) {
  2001			kfree(buf);
  2002			ath10k_warn(ar, "invalid calibration data length in nvmem-cell '%s': %zu != %u\n",
  2003				    cell_name, len, ar->hw_params.cal_data_len);
  2004			return -EMSGSIZE;
  2005		}
  2006	
  2007		ret = ath10k_download_board_data(ar, buf, len);
  2008		kfree(buf);
  2009		if (ret)
  2010			ath10k_warn(ar, "failed to download calibration data from nvmem-cell '%s': %d\n",
  2011				    cell_name, ret);
  2012	
  2013		return ret;
  2014	}
  2015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
