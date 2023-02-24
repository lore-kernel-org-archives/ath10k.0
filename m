Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B2C64ED8
	for <ath10k@archiver.kernel.org>; Fri, 24 Feb 2023 22:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T6/8H93hut+T0/JragdvHgu0R/T/yucu53d0lJGDQyA=; b=ONjrIWgoTlHblM
	UM/eml74vzJGHjD+N16CzDauLsFeue0MURmD0rx4BHxGDUVArLHCKGvkuGla9lijnkVsztWhi6b24
	OsXmd4D7WIZX1gEsDt+CxzROuPPOxWW1ePgzsJVe7a7WJj6tU8ii8fEPFRZkrvIDZHcGhGM4Wizd4
	kbcd8T9JeEzm2eOU47d1wHGnBzWHECyHBpiRjxDUhfEaltJRX3cRjtvmU51y4KacCwjBiCDIrZ54i
	itPP3Nu8wBni+lMc5xoaEzeE47miTcJiWxwVQ0TOt/HleIlOcaxpWuis4iNPUKGZipTwbxUqviXuK
	XZggxjzxOMmab+Pl0o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgwM-004Dpu-FS; Fri, 24 Feb 2023 22:53:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgwI-004Dox-LO
	for ath10k@lists.infradead.org; Fri, 24 Feb 2023 22:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677279198; x=1708815198;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KmHGPLoxcgbxsMwODeVTWSjc8Q+8BIrzmSaJ730MlIY=;
  b=CnkAdf6wCk5k/k9jC+AbkuRpvDAvhTGbQN/lOtPDSdqrc7cEPWBaPOFZ
   een48i2HrCRiGNncHem21V50Hyp6fCrVgRLsD2oiJIHVQ18pCHSP+zIil
   eVHiCYaRanfFZiIa55vWIt+gFLVj0UvxJlczGDpDEqx+fvjwSCUIspxHZ
   Jkl2ZN8CQ+rwC4Fp/Ri42aEOmK8FwwGlIDqxozuYjWm4/YViFG6f80l8H
   1FTIYBzNVbP6cmnCPMVdQtdLM87UqcbrA7IYI5d5/HLK+3A9s1BRSWqrm
   x1LxYWE9nmGC8+uXdToAL3HyTLfI138IsC29C7piHCdZHkArfeim2aAlt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321798256"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="321798256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815893708"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="815893708"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 14:53:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgw9-0002mF-27;
	Fri, 24 Feb 2023 22:53:09 +0000
Date: Sat, 25 Feb 2023 06:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 28013c35629647679e10cb1bbf36c3feec2af756
Message-ID: <63f93fb7.tFoAUzvOoAZ7ychv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_145318_773185_8E87FDF5 
X-CRM114-Status: UNSURE (   7.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 28013c35629647679e10cb1bbf36c3feec2af756  wifi: ath12k: remove memset with byte count of 278528

elapsed time: 724m

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
