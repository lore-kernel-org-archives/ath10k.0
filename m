Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF73ECAAD4
	for <ath10k@archiver.kernel.org>; Sat,  3 Sep 2022 05:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aPyem1GFgiMiWsntgh+PJZDn7nbThQy3Hvk4YIYvXjw=; b=AzB8tQts3F3a0h
	s4U6MnfRGkA2uP4H8DkV5q/xHeRa7oFyVvlaVFLC0Q4D8I1EHCgOLSmSEqyxI9AFWr959jmD4dg0L
	hKpsrrOdwMUCal7auYbVEpMcTuN7W41Sw+qICoqGtQ1wpJnHdIJ6hfUGue3urBfJJaRgUlMHQMC3m
	MqkdLNyEN1pRIhkq8lyhWSJDlzkvIsKKHMxhVl71bC26Wi8WhGSCQtPsJmuCeuQRc6BFQiqy5785T
	y7zhyDgN9jBH/PslC4Vni6N4nVh3rpwDa8EFygQ//qP3ISrf+jgcAeRxMG7sc1LOnzzJ4VoMV6JXl
	RIn19c7zEziyU1RqyNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oULUi-001SKO-Sp; Sat, 03 Sep 2022 05:15:00 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oULUg-001SIy-Hv
	for ath10k@lists.infradead.org; Sat, 03 Sep 2022 05:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662182098; x=1693718098;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FOZxSuxUbqMlSb/+RELghzTRaeN5BkS/pCWj7bhBU3w=;
  b=SlD69OZx7UGS4u+H5Ht9KKOXevrI7xy+ZvyPbg7DXFFMcrve/SWecMIW
   fceKOcqfjrSxlfXvApkhCvH4/2KmOvNGgPSUKTbd6ixKpQSfvOKnSGLoK
   m9A4CYiLmgVXXNHcla+9tAX6V/r+FfDXif4KUrqlPV0jmCiu6o7GYGm2M
   bg68GkfbHfkfXqvUNzJYctAEeqsPgeUz34d9EzcmJBH2dEiZkNVoDU5GC
   hUGVZEcx9k8fhcdfOnmHKeyRDM8iQWss+gckKbHJ8OsyqJgTcMHYqH4J4
   BTRIFHMVx8tEMo7GnanumR0D+k1yKivTk9d/SYYiSVoWvdQ8eTYjAsgFQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="283121016"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="283121016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 22:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="681502803"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 22:14:51 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oULUY-00016l-1L;
	Sat, 03 Sep 2022 05:14:50 +0000
Date: Sat, 03 Sep 2022 13:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 e4a590b08d1309181f3904ae2fc622e018991ca9
Message-ID: <6312e2a2.tpLuLiWQY77fs5xQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_221458_672494_365D670C 
X-CRM114-Status: UNSURE (   7.11  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: e4a590b08d1309181f3904ae2fc622e018991ca9  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 981m

configs tested: 24
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
