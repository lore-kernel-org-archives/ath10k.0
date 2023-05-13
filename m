Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9957C77B7D
	for <ath10k@archiver.kernel.org>; Sat, 13 May 2023 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gt5nfXzJxgzsOB8OckHKTHehOl++7KB7kM8R021yX+k=; b=CI1ERz+JN+SeTL
	9doiJ1zZ812XBQrg1JjpQZUi0frxZg/S//Yg1VfObCXQKkTyV8T5J2VLyqKFHvIh5VyBhApURnlTJ
	Wn3b1u0HOyXg64BveLaazwEIySqYj7H83HRbK524dDhCrLpJBtXJMLc1pwKoBIU7XlhJcjs0djOCn
	rTblihOiZ00ecZxoQA4qq/AlfsVZFROVk573aLdplCBKpD1VQnoUvl+ZtCxSnrtQIefRRT7hfG0Xi
	0GgNXtQEprAABLo7vjoCPY1faTBHNX8tywPhsYYDd7vbhfqZBSbUPVIuADG4CJqt80riIQBwxY+x4
	LbBzgljF/88tr0MRS/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxmDf-00EFNv-2i;
	Sat, 13 May 2023 10:11:19 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxmDc-00EFMT-0E
	for ath10k@lists.infradead.org;
	Sat, 13 May 2023 10:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683972676; x=1715508676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRzsCyQYQaEjIXVtYh52dSY+xbfaaIbbvtZS3sBR0S8=;
  b=FdgB6jZRiFmv5dlDwzVnaPsMxdGWJ4XkjsvlNrPbciWX/X2SiVmofJkF
   S1YGSAV9gneXeOxbAXEDw34la/th4CShYLCb46IcdiwP6HD8n/lupqYLw
   7Y6mnhxGw+5adRW0fM/7PTRnuOBTGXOBOHI+AahTO7Cjz6Vx794pXwNNR
   z4BT2ECACEXLJBRyh13WvhosCl3uSb9LWtBf5TOz+WGPmeTSVsJLE14ii
   ciOj6XiEnef9t0R6JodhriIbPRClkz6Pb1jrIUsvs/+gTKcPFuJRpAbFc
   eMIbPwAU2VHXbsZX+DUYUX5THmwd+VaX2z3JaHzfs+MvFABOPTO37zivH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340278998"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="340278998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 03:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733329071"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="733329071"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2023 03:11:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxmDU-0005Ry-1a;
	Sat, 13 May 2023 10:11:08 +0000
Date: Sat, 13 May 2023 18:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [kvalo-ath:pending 50/51] mac.c:(.text+0xeb3c): multiple definition
 of `ath11k_tm_wmi_event'; riscv32-linux-ld: DWARF error: could not find
 abbrev number 96
Message-ID: <202305131811.xFAUtLOz-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_031116_202305_3937CBDC 
X-CRM114-Status: GOOD (  10.21  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   229ea354bdd24bf3c33c9447674fab8d609e24a2
commit: f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c [50/51] wifi: ath11k: factory test mode support
config: riscv-randconfig-c032-20230510 (https://download.01.org/0day-ci/archive/20230513/202305131811.xFAUtLOz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131811.xFAUtLOz-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: riscv32-linux-ld: DWARF error: could not find abbrev number 178438570
   drivers/net/wireless/ath/ath11k/mac.o: in function `ath11k_tm_wmi_event':
>> mac.c:(.text+0xeb3c): multiple definition of `ath11k_tm_wmi_event'; riscv32-linux-ld: DWARF error: could not find abbrev number 96
   drivers/net/wireless/ath/ath11k/wmi.o:wmi.c:(.text+0x821c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
