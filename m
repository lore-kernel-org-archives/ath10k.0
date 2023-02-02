Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD85CC05027
	for <ath10k@archiver.kernel.org>; Thu,  2 Feb 2023 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhC8aEyjG2f6CTgqLXpWpjhdOEwSxBbnDog/tm4RlOw=; b=Wvnsw2KZJAwegT
	eeeYPAEn1khrHg6ejlfjuEtN9sVzhVgFzQm5UA06pqj9RlcgmNhpBGZkHBVmCOo4XijzUMdVOrfi4
	9N0S2yS6sqX9PAKkBVmNF5d3Y5IYBf0fsT/y0d5jpWuO4N1tWLU4F65/B3KTNpJIOZnvEtsKvE+TV
	tWDxI8+mEmB7Ale1Jul3y1woWsb5F1tIoxIYfVFWuPF02Wlu8sPu/J0alfkZulPkYDXw3zNPIVmRl
	klk0w2lZMgTXmm5Co5guX7763M6wP2mFFpgey1wSYp4mBtXoJAkNLkgy6e4Tarf7E0C7icLi2xmTP
	On/GRuUnIl+uJxC1hisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNU0I-00EdXU-D4; Thu, 02 Feb 2023 07:27:30 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNU0E-00EdWM-VW
	for ath10k@lists.infradead.org; Thu, 02 Feb 2023 07:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675322846; x=1706858846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CsNdO7enAaB1DnnDD0uULEpC8X/6XBAenIZVjgTdu/M=;
  b=caEs/rIXGX5fIu/O5NVFyiPsOHdvukbQIWZHh0ZXHRC74YRdayy/20GJ
   qmL/pPtACkXTWLLIDjNLgXEk/FI0LWrWB2irOSxIi0HbV+fRvV8MWoOrR
   5K7jwvfWuy9vDE+60h8uXpQPl6TJx4cXref3vyQ3LYm6hZHxK5SwpmnDB
   JcjwuIPRISczSuiWzhsYgBHU7N18OT0cpK/shgosbWFy5uVuZjtZ/NrI/
   6t7PPcIiidkn3/Af81sb1Z37/MPWnr7wTJk/Nm97R40ZXop2hw2J8/4SK
   mn/+rtJxnKYUTdXPGInKnxIM3DBnqLcPmoXZ1undr7IWLVuL/Ax59hQvD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312023379"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="312023379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 23:27:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910644221"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="910644221"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 23:27:16 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNU03-0006H6-2A;
	Thu, 02 Feb 2023 07:27:15 +0000
Date: Thu, 2 Feb 2023 15:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: equu@openmail.cc, lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	robh@kernel.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, equu@openmail.cc
Subject: Re: [PATCH v2 3/3] wifi: ath10k: only load compatible DT cal data
Message-ID: <202302021511.hIXEXftH-lkp@intel.com>
References: <20230202041823.2879262-4-equu@openmail.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202041823.2879262-4-equu@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_232727_103853_58F93074 
X-CRM114-Status: GOOD (  17.02  )
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on helgaas-pci/for-linus wireless-next/main wireless/main linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/equu-openmail-cc/wifi-ath9k-stop-loading-incompatible-DT-cal-data/20230202-131914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
patch link:    https://lore.kernel.org/r/20230202041823.2879262-4-equu%40openmail.cc
patch subject: [PATCH v2 3/3] wifi: ath10k: only load compatible DT cal data
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302021511.hIXEXftH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d3f328c8809b6349090ad2a2ee78250d657edb58
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review equu-openmail-cc/wifi-ath9k-stop-loading-incompatible-DT-cal-data/20230202-131914
        git checkout d3f328c8809b6349090ad2a2ee78250d657edb58
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_download_cal_nvmem':
   drivers/net/wireless/ath/ath10k/core.c:1985:15: error: implicit declaration of function 'of_pci_node_match_device' [-Werror=implicit-function-declaration]
    1985 |              !of_pci_node_match_device(ar->dev->of_node,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath10k/core.c:1987:24: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
    1987 |                 return ERR_PTR(-ENOENT);
         |                        ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1987 drivers/net/wireless/ath/ath10k/core.c

  1954	
  1955	static int ath10k_download_cal_nvmem(struct ath10k *ar, const char *cell_name)
  1956	{
  1957		struct nvmem_cell *cell;
  1958		void *buf;
  1959		size_t len;
  1960		int ret;
  1961	
  1962		/* devm_nvmem_cell_get() will get a cell first from the OF
  1963		 * DT node representing the given device with nvmem-cell-name
  1964		 * "calibration", and from the global lookup table as a fallback,
  1965		 * and an ath9k device could be either a pci one or a platform one.
  1966		 *
  1967		 * If the OF DT node is not compatible with the real device, the
  1968		 * calibration data got from the node should not be applied.
  1969		 *
  1970		 * dev_is_pci(ar->dev) && ( no OF node || caldata not from node
  1971		 * || not compatible ) -> do not use caldata .
  1972		 *
  1973		 * !dev_is_pci(ar->dev) -> always use caldata .
  1974		 *
  1975		 * The judgement for compatibility differs with ath9k for many
  1976		 * DT using "qcom,ath10k" as compatibility string.
  1977		 */
  1978		if (dev_is_pci(ar->dev) &&
  1979		    (!ar->dev->of_node ||
  1980		     (of_property_match_string(ar->dev->of_node,
  1981					       "nvmem-cell-names",
  1982					       cell_name) < 0) ||
  1983		     !of_device_is_compatible(ar->dev->of_node,
  1984					      "qcom,ath10k") ||
  1985		     !of_pci_node_match_device(ar->dev->of_node,
  1986					       &ath10k_pci_driver)))
> 1987			return ERR_PTR(-ENOENT);
  1988	
  1989		cell = devm_nvmem_cell_get(ar->dev, cell_name);
  1990		if (IS_ERR(cell)) {
  1991			ret = PTR_ERR(cell);
  1992			return ret;
  1993		}
  1994	
  1995		buf = nvmem_cell_read(cell, &len);
  1996		if (IS_ERR(buf))
  1997			return PTR_ERR(buf);
  1998	
  1999		if (ar->hw_params.cal_data_len != len) {
  2000			kfree(buf);
  2001			ath10k_warn(ar, "invalid calibration data length in nvmem-cell '%s': %zu != %u\n",
  2002				    cell_name, len, ar->hw_params.cal_data_len);
  2003			return -EMSGSIZE;
  2004		}
  2005	
  2006		ret = ath10k_download_board_data(ar, buf, len);
  2007		kfree(buf);
  2008		if (ret)
  2009			ath10k_warn(ar, "failed to download calibration data from nvmem-cell '%s': %d\n",
  2010				    cell_name, ret);
  2011	
  2012		return ret;
  2013	}
  2014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
