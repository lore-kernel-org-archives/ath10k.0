Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0579CAC5BB
	for <ath10k@archiver.kernel.org>; Sun, 28 Sep 2025 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuPuITlo4f7ITpOpX0ICBIKAZEuzXuU9buE+eU/J75M=; b=cuo1ZcjLuqmXza4Ml1Dt8Qxxvw
	ZkrGQ69GE180XejnFmeSOtruR21POu4IqHDYI5xVVd5d617GZphxYiBAm2UdTw20PW9qGsVsUi5Bd
	Q3LjhFMW+HhQMXKwQtyq/kZuLHZBol8cFISnYyd3U35u/h85gwa3cp77wfOQ2k5CJmV8IwqRMmnJd
	eGy8LzpL3EXeRdkUdrdNI0xhgWvS8lsAbzyKeWzb+R6vuXwz6kHPAZRhEQswfEj6iGLdjuiI1cXk/
	BioUZ6Hxzyt01qcEcb5Cu8YixSBZaAeRT6AYVLKGtFfqRVFVouKrj4IPOfpdyFLjMLNzOT8uRgc+9
	RA+pe3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nEj-0000000EUMh-2hoW;
	Sun, 28 Sep 2025 08:58:29 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nEg-0000000EULv-3WY1
	for ath10k@lists.infradead.org;
	Sun, 28 Sep 2025 08:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759049906; x=1790585906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/CYU6XJ7EXuyYL/4R8INs3KNybIO1oJqRqDiB1jhAM=;
  b=X5l0UWWguyxqeL8Ab534wRqNwRVmF7yfurJvTiKFjvaI0fN0Os72bt65
   LQyVJNMZkQXDL/Di/EVlMaA9fKGmPsKSBCMxHcv/XrU4m2Y8uJ6LDkWDC
   NrJ+28hhgmIzdyCJmVRoHNu8kmZDx3j8ONyBezt2pEKlSUdlsEiuWjS88
   smPnbAOzfbkYko2raXvR3i6CeyyCEw1QxxCDh62Fi55qiC4Qbid6yqbOt
   S6bdJ9Y8WcANlz+BPYNxCmCwi3bagCZX2XPLlxlJ+2tiiDRz1zCLJkYLh
   WedyxxVdvcgCGsuH5Gz85dTUv1az0Lo4r23CemfuQLfyn/m52kbW83dNU
   w==;
X-CSE-ConnectionGUID: GxvO9kOtQzSsE0XOiRgA8A==
X-CSE-MsgGUID: B1jbf6c/TdWNRKbEH7xlzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="83932578"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="83932578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 01:58:21 -0700
X-CSE-ConnectionGUID: FyDcOJrtQmKJYH43A1yfKQ==
X-CSE-MsgGUID: ysjf69TMRyysG77FYOM9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="177243145"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2025 01:58:20 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2nEW-0007f1-1L;
	Sun, 28 Sep 2025 08:58:16 +0000
Date: Sun, 28 Sep 2025 16:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: Support for FTM TLV test commands
Message-ID: <202509281616.IKHm5zbZ-lkp@intel.com>
References: <20250926201303.194029-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926201303.194029-1-loic.poulain@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_015826_923195_EE369302 
X-CRM114-Status: GOOD (  11.94  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Loic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on wireless/main wireless-next/main linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/wifi-ath10k-Support-for-FTM-TLV-test-commands/20250927-041539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250926201303.194029-1-loic.poulain%40oss.qualcomm.com
patch subject: [PATCH ath-next] wifi: ath10k: Support for FTM TLV test commands
config: x86_64-randconfig-121-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281616.IKHm5zbZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281616.IKHm5zbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281616.IKHm5zbZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath10k/testmode.c:93:23: sparse: sparse: cast to restricted __le32
>> drivers/net/wireless/ath/ath10k/testmode.c:93:23: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wireless/ath/ath10k/testmode.c:93:23: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/wireless/ath/ath10k/testmode.c:94:26: sparse: sparse: cast to restricted __le32
   drivers/net/wireless/ath/ath10k/testmode.c:94:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/wireless/ath/ath10k/testmode.c:94:26: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wireless/ath/ath10k/testmode.c:585:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] tlv_header @@     got unsigned int [assigned] [usertype] hdr_info @@
   drivers/net/wireless/ath/ath10k/testmode.c:585:37: sparse:     expected restricted __le32 [usertype] tlv_header
   drivers/net/wireless/ath/ath10k/testmode.c:585:37: sparse:     got unsigned int [assigned] [usertype] hdr_info
>> drivers/net/wireless/ath/ath10k/testmode.c:586:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned short [assigned] [usertype] total_bytes @@
   drivers/net/wireless/ath/ath10k/testmode.c:586:38: sparse:     expected restricted __le32 [usertype] len
   drivers/net/wireless/ath/ath10k/testmode.c:586:38: sparse:     got unsigned short [assigned] [usertype] total_bytes
>> drivers/net/wireless/ath/ath10k/testmode.c:587:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] msgref @@     got unsigned char [usertype] ftm_msgref @@
   drivers/net/wireless/ath/ath10k/testmode.c:587:41: sparse:     expected restricted __le32 [usertype] msgref
   drivers/net/wireless/ath/ath10k/testmode.c:587:41: sparse:     got unsigned char [usertype] ftm_msgref
>> drivers/net/wireless/ath/ath10k/testmode.c:590:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] segmentinfo @@     got unsigned char [assigned] [usertype] seginfo @@
   drivers/net/wireless/ath/ath10k/testmode.c:590:46: sparse:     expected restricted __le32 [usertype] segmentinfo
   drivers/net/wireless/ath/ath10k/testmode.c:590:46: sparse:     got unsigned char [assigned] [usertype] seginfo

vim +93 drivers/net/wireless/ath/ath10k/testmode.c

    77	
    78	static void ath10k_tm_event_segmented(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
    79	{
    80		struct wmi_ftm_cmd *ftm = (struct wmi_ftm_cmd *)skb->data;
    81		u8 total_segments, current_seq;
    82		struct sk_buff *nl_skb;
    83		u8 const *buf_pos;
    84		u16 datalen;
    85		u32 data_pos;
    86		int ret;
    87	
    88		if (skb->len < sizeof(*ftm)) {
    89			ath10k_warn(ar, "Invalid ftm event length: %d\n", skb->len);
    90			return;
    91		}
    92	
  > 93		current_seq = FIELD_GET(ATH10K_FTM_SEGHDR_CURRENT_SEQ, ftm->seg_hdr.segmentinfo);
    94		total_segments = FIELD_GET(ATH10K_FTM_SEGHDR_TOTAL_SEGMENTS,
    95					   ftm->seg_hdr.segmentinfo);
    96		datalen = skb->len - sizeof(*ftm);
    97		buf_pos = ftm->data;
    98	
    99		if (current_seq == 0) {
   100			ar->testmode.expected_seq = 0;
   101			ar->testmode.data_pos = 0;
   102		}
   103	
   104		data_pos = ar->testmode.data_pos;
   105	
   106		if ((data_pos + datalen) > ATH_FTM_EVENT_MAX_BUF_LENGTH) {
   107			ath10k_warn(ar, "Invalid ftm event length at %u: %u\n",
   108				    data_pos, datalen);
   109			ret = -EINVAL;
   110			return;
   111		}
   112	
   113		memcpy(&ar->testmode.eventdata[data_pos], buf_pos, datalen);
   114		data_pos += datalen;
   115	
   116		if (++ar->testmode.expected_seq != total_segments) {
   117			ar->testmode.data_pos = data_pos;
   118			ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "partial data received %u/%u\n",
   119				   current_seq + 1, total_segments);
   120			return;
   121		}
   122	
   123		ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "total data length %u\n", data_pos);
   124	
   125		nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
   126							   2 * sizeof(u32) + data_pos,
   127							   GFP_ATOMIC);
   128		if (!nl_skb) {
   129			ath10k_warn(ar, "failed to allocate skb for testmode wmi event\n");
   130			return;
   131		}
   132	
   133		ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_CMD, ATH10K_TM_CMD_TLV);
   134		if (ret) {
   135			ath10k_warn(ar, "failed to put testmode wmi event attribute: %d\n", ret);
   136			kfree_skb(nl_skb);
   137			return;
   138		}
   139	
   140		ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_WMI_CMDID, cmd_id);
   141		if (ret) {
   142			ath10k_warn(ar, "failed to put testmode wmi event cmd_id: %d\n", ret);
   143			kfree_skb(nl_skb);
   144			return;
   145		}
   146	
   147		ret = nla_put(nl_skb, ATH10K_TM_ATTR_DATA, data_pos, &ar->testmode.eventdata[0]);
   148		if (ret) {
   149			ath10k_warn(ar, "failed to copy skb to testmode wmi event: %d\n", ret);
   150			kfree_skb(nl_skb);
   151			return;
   152		}
   153	
   154		cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

