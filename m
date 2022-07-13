Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9683C433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Jul 2022 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jk97tNCVZzffhbTUGJ/l8JuSEalZs0JuErTmXqU5Fg=; b=EpE5wNTEoOFqZ6
	BLlvCzRPuFdCE/3vg+JsZLa7hwHffem7DKG8zRX736jc5MUqkzIEnynrOTSgw1NXAOs7D0u0hvRbi
	No6gu8A495ePT0MQcqIl4Q2YotqigXJuRMUrmyiYPgT0UYjh4DXLqfFlTXIsb4Q6+53Z11Qlqb7v1
	2A6FkmvFgvvGwnaN5Qx8ChehozZ2qFPU6f4YW4ulgzdFWPfIw15D79KPEZfe5/rD+1JaAvrJCoOpz
	cI560243E9MKVqcJRLmRNAwlYS+NvPIDxEpQD0UlEkjPpfVzLmW/kcHprnzBWXN7+SIOOngHkyR5Z
	MVjNdLcIjSxjDsVI4toQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWJ0-000vxW-Gi; Wed, 13 Jul 2022 06:57:06 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWIy-000vRb-88
	for ath10k@lists.infradead.org; Wed, 13 Jul 2022 06:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657695424; x=1689231424;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r5v189e9xgg1wb9JERPbP3fHTc85/pJKQBh6rJoNWY8=;
  b=aTjjlh8o79gl3Ht+z2r5+AgqLqSOMCt4Vw2wPJrJu4dkiiRc4sWu9Ldq
   arhC67mcrA1VuLbILFdDmHyO6QFTUCreDZ90ZbcWkPzI9crjepK/qgcVi
   6CBkuWDTt4JUY/cdJNpCfuwv/oT0dGfKpjp3evdx5cBgHEvF8tx3SUcmn
   5I5ovzqdSfmTXXVNqt4K2sfXPxeIVGDCSrwtq9lS1Hk2WVYCrLe8L4ib9
   wXTVsqaLAfk0ry+5VQaMtafCJfspYSndeucQhXvWSfmTYOx0w0fZ2jmST
   dQy8RdaX1ZlsDRxKxvGs4C5V6x2K3Dz0/mlK5/Evs2+TDmIRjFuN1tHae
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="282681177"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="282681177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 23:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="545726889"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2022 23:56:51 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBWIj-0003Ec-Ua;
	Wed, 13 Jul 2022 06:56:49 +0000
Date: Wed, 13 Jul 2022 14:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 226f1392c88411d3004618fae0f1b217ac214b5a
Message-ID: <62ce6cad.NG071d4di2DKr/GS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_235704_344681_6E0DD3BF 
X-CRM114-Status: UNSURE (   6.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 226f1392c88411d3004618fae0f1b217ac214b5a  Merge branch 'pending' into master-pending

elapsed time: 1393m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
