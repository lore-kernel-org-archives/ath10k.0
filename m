Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA75BC6FA8E
	for <ath10k@archiver.kernel.org>; Sat, 25 Feb 2023 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OT84DXetg4VCWyaGJ24a+s2RoyKkThQ0TABJJeJjzTc=; b=HAtjL2Sy7aNgsg
	RC0WCX7m2Tmm+XRKoass2imYzERu4i+xwCV55wqrodEgxUuSx9GCvTguUHVwM3L/yHvdmliLiTM08
	U0lFgIGE6N3mgcsJmWoryOzWRpURc0xS8vUXpLjVP1V71ncYpQGK7okNFNCyUncBwSbEvnWIQt5aF
	4IXsu8hZOOmBRgBl210qLtOd2f3bS7MKx2FWKo86yRXKs+vbp+N1kGuZnrOBWOytflV/YHpV4stQA
	pLJ75yuzN+DQbrjlbJHRMUVeZTqWXNAJBEM9GfdZGwpo5+AcOGUch+s/efWOHrxLoHomorkdUrW2i
	phgI5OFA2KFm0w7INq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVm5k-004pFl-0w; Sat, 25 Feb 2023 04:23:24 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVm5g-004pEq-L7
	for ath10k@lists.infradead.org; Sat, 25 Feb 2023 04:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677299000; x=1708835000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/WIA25m5TaoUjdBlUqd3mOeQ8sbaIsbNzqqGLiLkFwo=;
  b=gB1Psi0lXzfrFOeePnF1OsBgnoX4hWsolkDJKBkMpzpAOihkb2FXDs1N
   sZAtJ8Wac+k5STpDMvhCyhIXV8zyZgYEKCMuD5h3hJf+0XkLhe+3w5NEp
   xzJojeMTFWJWFm7mlMPqUvOVrAp+DebPnYoGR6ySU0zYNJZwri/VRDNHI
   /TQrf/CBpk6sqZ8H1YAqgpn1spcU/CnbxzqtEJESshJHD7b/mV5pRIIPy
   ZhnYQGzNdsbfRCKxY9Sufl7qUuVX482JzjKJfJgZUSxRoihmDCUaeHPoV
   Z3qRfeDjagAhs/IXAISfBmffGHHN3VRRn7PnlEPk7iVSO7f6vK13xH5Xv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321834782"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="321834782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 20:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705507899"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="705507899"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 20:23:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVm5c-0002uj-36;
	Sat, 25 Feb 2023 04:23:16 +0000
Date: Sat, 25 Feb 2023 12:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4b4b3b5b3a4f7254279cc202716cac89134781c9
Message-ID: <63f98d0d.Xh8V5WGPAd9WDQ4f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_202320_764594_8FAFA0EF 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 4b4b3b5b3a4f7254279cc202716cac89134781c9  wifi: ath6kl: reduce WARN to dev_dbg() in callback

elapsed time: 768m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
