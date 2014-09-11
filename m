Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSD7o-0002rp-W4
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 22:46:01 +0000
Message-ID: <5412260F.80607@candelatech.com>
Date: Thu, 11 Sep 2014 15:45:35 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 3/3] ath10k: add cal_data debugfs file
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203152.12514.95332.stgit@potku.adurom.net>
In-Reply-To: <20140911203152.12514.95332.stgit@potku.adurom.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On 09/11/2014 01:31 PM, Kalle Valo wrote:
> Provide calibration data used by the firmware to user space via a debugfs file.
> This makes it easier to debug calibration related problems.
>
> Example:
>
> sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal

Is this data that could be made human readable, or does it need to
be parsed by some private tool?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
