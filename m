Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ycgwx-0000vo-9T
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 21:10:23 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 2E7D240A626
 for <ath10k@lists.infradead.org>; Mon, 30 Mar 2015 14:09:58 -0700 (PDT)
Message-ID: <5519BBA5.7080704@candelatech.com>
Date: Mon, 30 Mar 2015 14:09:57 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on ar->max_num_vdevs and WMI ops config.
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

I'm porting forward my changes to the 4.0-rc6 kernel, and I notice
something a bit confusing to me.

It seems some upstream patch has added ar->max_num_vdevs and some related
fields.

But, in places like this:

static struct sk_buff *ath10k_wmi_op_gen_init(struct ath10k *ar)
{
	struct wmi_init_cmd *cmd;
	struct sk_buff *buf;
	struct wmi_resource_config config = {};
	u32 len, val;

	config.num_vdevs = __cpu_to_le32(TARGET_NUM_VDEVS);
	config.num_peers = __cpu_to_le32(TARGET_NUM_PEERS);
	config.num_offload_peers = __cpu_to_le32(TARGET_NUM_OFFLOAD_PEERS);


We are still using constants instead of ar->max_num_vdevs.

Was this done on purpose for some reason?

It will make my patches to support CT features a bit cleaner if we use the
values stored in ar->max_num_vdevs etc.


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
