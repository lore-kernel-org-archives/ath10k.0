Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36ABEE49A5
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 02:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am4OOnPPbubf2kfyi+JGW3Geul3wCxEUUl8cy/eDrOQ=; b=GIStUZ2DJRcMvo
	tueD5+6+wMP+oKRgA+rNsJt2GFzv5umWJm15mouK7CEAxx9WdISoy5aJL5Szn4yRKKnZrDZkCOOTS
	yjAqxuKAwXuKGG/1HcxTZIpM6Y1m9/G3ZnLqICffu0BtA1TC+8K0Kf0DeOaz5+ssWVGyspThy52A6
	tPPuUQi+WcKdk6hKWrefbS/0aJku5fjXl3rmTue4cxEe+CyWc3GZxSsCk/aji2fm5kLWkhEqf8FFM
	NRg/80l/aSuwiDpAOseAGpxwHa7gKY5ZYUR0uPsV7jzvAI0xl863B1e/VhYlCKQ08f24VywkzrKiQ
	FRtMapuWKFK9AZyA+qeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdB9-00H3XA-2g;
	Wed, 23 Aug 2023 02:01:03 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdB5-00H3WN-1T
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 02:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692756059; x=1724292059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yl+KEQzc4x6NHVj3CjHlnSRqdf04HRQDNwnh6bBobF4=;
  b=Vdwh5GSt4QLxp7DErGHlTRKyzZ2n+OzrlkyN+j/mlhCH81SyiBDHk0Z8
   cfxg4wr2W42Hw5b52dnIOBfb+E/8+L2UoeaQ2kGZhtL1Q3rT/tnjb4vLD
   1r74hdn2jqCT3Wv4fmds0CfO10k1zzyFOE20mkIin23cIdtvwxkU7tCIk
   Koxbp00eEBFZk39I81UKH0tLuFBsDevWfacH+zFuXQmllKeyf7+zSAln3
   zTC0DHVSLpTZpmEU0lRDJvGahj3LOI1pqLcBasuixOZlV47mky4NF7dUv
   qFIuVQDWcT+FnAilAvZevOUdwNrAx3PJhrVp9bGJGucHYGQrOCK6dc77j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460403854"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460403854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="765956470"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="765956470"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 19:00:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdAY-0000k8-20;
	Wed, 23 Aug 2023 02:00:26 +0000
Date: Wed, 23 Aug 2023 09:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org, Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH 1/3] wifi: ath10k: cleanup CE initialization
Message-ID: <202308230929.vOiA1VSe-lkp@intel.com>
References: <20230822155532.95983-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822155532.95983-1-dmantipov@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_190059_566397_E158C5AC 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on wireless-next/main wireless/main linus/master v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/wifi-ath10k-simplify-ath10k_peer_assoc_h_vht/20230822-235854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230822155532.95983-1-dmantipov%40yandex.ru
patch subject: [PATCH 1/3] wifi: ath10k: cleanup CE initialization
config: sparc64-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230929.vOiA1VSe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230929.vOiA1VSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230929.vOiA1VSe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_hif_power_up':
>> drivers/net/wireless/ath/ath10k/snoc.c:1083:1: warning: label 'err_free_rri' defined but not used [-Wunused-label]
    1083 | err_free_rri:
         | ^~~~~~~~~~~~


vim +/err_free_rri +1083 drivers/net/wireless/ath/ath10k/snoc.c

0fa4fbe9b8cf76 Govind Singh   2018-04-10  1056  
3c545a25939c27 Rakesh Pillai  2019-02-08  1057  static int ath10k_snoc_hif_power_up(struct ath10k *ar,
3c545a25939c27 Rakesh Pillai  2019-02-08  1058  				    enum ath10k_firmware_mode fw_mode)
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1059  {
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1060  	int ret;
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1061  
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1062  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "%s:WCN3990 driver state = %d\n",
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1063  		   __func__, ar->state);
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1064  
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1065  	ret = ath10k_hw_power_on(ar);
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1066  	if (ret) {
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1067  		ath10k_err(ar, "failed to power on device: %d\n", ret);
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1068  		return ret;
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1069  	}
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1070  
3c545a25939c27 Rakesh Pillai  2019-02-08  1071  	ret = ath10k_snoc_wlan_enable(ar, fw_mode);
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1072  	if (ret) {
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1073  		ath10k_err(ar, "failed to enable wcn3990: %d\n", ret);
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1074  		goto err_hw_power_off;
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1075  	}
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1076  
4945af5b264fbd Govind Singh   2018-04-17  1077  	ath10k_ce_alloc_rri(ar);
4945af5b264fbd Govind Singh   2018-04-17  1078  
7279d6262224cd Dmitry Antipov 2023-08-22  1079  	ath10k_snoc_init_pipes(ar);
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1080  
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1081  	return 0;
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1082  
31561e8557cd1e Rakesh Pillai  2020-12-12 @1083  err_free_rri:
31561e8557cd1e Rakesh Pillai  2020-12-12  1084  	ath10k_ce_free_rri(ar);
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1085  	ath10k_snoc_wlan_disable(ar);
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1086  
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1087  err_hw_power_off:
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1088  	ath10k_hw_power_off(ar);
5f1aa93ffa1f36 Rakesh Pillai  2020-12-12  1089  
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1090  	return ret;
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1091  }
0fa4fbe9b8cf76 Govind Singh   2018-04-10  1092  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
