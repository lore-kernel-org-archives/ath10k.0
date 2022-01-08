Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE2C433F5
	for <ath10k@archiver.kernel.org>; Sat,  8 Jan 2022 03:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZibiUQg5Dnwvq3w/HFo+LFTsYbstt4dvCQe1V/t3dOs=; b=iIVtqxP8+dRQuQ
	3ivyhWR0x73Bpp0F7Av2OE7uoUmB5mtuWFY1jm6JLPup10DfRSxJbQAlxvrt8xVTofp8veLdis/yn
	Vx3scV2qYXQhFbfHkzvQJa+MtytNosQkoolG/4gyqG+/a0WeNaNh9aS9tp6/P3h/tkpIY7VUVJzP1
	E3ZI5T12tHmx1mT+9Od/ZoSGrKphCi+NxDjPDQKVao4DB9WDBBBR9GbJFrv7lP65bIKou7txYA0Ym
	0OdrBI/x97u4WpGrO9jKpl1YgrHNR42puJuhAx6UiNJGHpqBvZBSgV/9082zLnQJfYEZJ5Do/Sg2H
	TJUmo2d6+j8A4z0AJReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n62Bl-005q4D-D8; Sat, 08 Jan 2022 03:14:41 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n62Bh-005q3r-N0
 for ath10k@lists.infradead.org; Sat, 08 Jan 2022 03:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641611677; x=1673147677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+u3dTzcaO34xqmBxu4T2D6mrH13SWuF61TSnDFmDAVQ=;
 b=hB4VRO5vk1CvT7gEVq6IjqIgQ0KrGDkCKfqN0RO9Lohye/25TmzOTrU+
 RVDE+MZJ1in1UFfEjMUOtsvoO8y6ZlmkOifbR46VOeiexO9YOkZrLULVB
 UAl9uQs6kILDTT7Zffnk4qEyG8go1HMzpwFwkU1/CZSvjEXMBFHnI/vwT
 KbeiH7PS9W28HSZZ1EXMAq3V957CZjreaTG1/BJUjJIwo6YkKWKeKK6DL
 /avKriq1kTl3Nn04n27DX4H3WyI0wu8JTasM85lP8OSP3picf6Wm3HoIg
 CxNVEusUrrYJL0PWFnsLiw2pRdlaY0TRdw5Jyb1bBDUq/txIcEd5V1ENJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="242931290"
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; d="scan'208";a="242931290"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 19:14:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; d="scan'208";a="514018652"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 07 Jan 2022 19:14:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n62Bb-0000Cp-EK; Sat, 08 Jan 2022 03:14:31 +0000
Date: Sat, 8 Jan 2022 11:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Kumar <kuabhs@chromium.org>, kvalo@codeaurora.org,
 dianders@chromium.org
Cc: kbuild-all@lists.01.org, pillair@codeaurora.org, kuabhs@chromium.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
Message-ID: <202201081118.iN7Rcf4J-lkp@intel.com>
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_191437_854448_352F48CF 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Abhishek,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on kvalo-wireless-drivers-next/master kvalo-wireless-drivers/master v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Abhishek-Kumar/ath10k-search-for-default-BDF-name-provided-in-DT/20220108-040711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220108/202201081118.iN7Rcf4J-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/98e7f008cb14b9c4038287915c271bb485a89346
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Abhishek-Kumar/ath10k-search-for-default-BDF-name-provided-in-DT/20220108-040711
        git checkout 98e7f008cb14b9c4038287915c271bb485a89346
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/wireless/ath/ath10k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_parse_default_bdf_dt':
>> drivers/net/wireless/ath/ath10k/core.c:1103:115: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
    1103 |                             "default board name is longer than allocated buffer, board_name: %s; allocated size: %d\n",
         |                                                                                                                  ~^
         |                                                                                                                   |
         |                                                                                                                   int
         |                                                                                                                  %ld
    1104 |                             board_name, sizeof(ar->id.default_bdf));
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~                                                 
         |                                         |
         |                                         long unsigned int


vim +1103 drivers/net/wireless/ath/ath10k/core.c

  1083	
  1084	int ath10k_core_parse_default_bdf_dt(struct ath10k *ar)
  1085	{
  1086		struct device_node *node;
  1087		const char *board_name = NULL;
  1088	
  1089		ar->id.default_bdf[0] = '\0';
  1090	
  1091		node = ar->dev->of_node;
  1092		if (!node)
  1093			return -ENOENT;
  1094	
  1095		of_property_read_string(node, "qcom,ath10k-default-bdf",
  1096					&board_name);
  1097		if (!board_name)
  1098			return -ENODATA;
  1099	
  1100		if (strscpy(ar->id.default_bdf,
  1101			    board_name, sizeof(ar->id.default_bdf)) < 0)
  1102			ath10k_warn(ar,
> 1103				    "default board name is longer than allocated buffer, board_name: %s; allocated size: %d\n",
  1104				    board_name, sizeof(ar->id.default_bdf));
  1105	
  1106		return 0;
  1107	}
  1108	EXPORT_SYMBOL(ath10k_core_parse_default_bdf_dt);
  1109	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
