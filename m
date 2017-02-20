Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cfs78-0006uN-MH
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 17:51:10 +0000
Message-ID: <58AB2C74.7060603@candelatech.com>
Date: Mon, 20 Feb 2017 09:50:44 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: who care of addba/delba in ath10k?
References: <1beccb9973bd869d9cadd0b6823ce854@cweb06.nm.nhnsystem.com>
 <1487601470622.92250@qti.qualcomm.com>
In-Reply-To: <1487601470622.92250@qti.qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, KwangMin Kim <kim25444@naver.com>
Cc: "gwondori@nimbus.kr" <gwondori@nimbus.kr>

Yes, it is in firmware.

Thanks,
Ben

On 02/20/2017 06:37 AM, Shajakhan, Mohammed Shafi (Mohammed Shafi) wrote:
> I think that ath10k's addba / delba is doing firmware. Is this right?
>
> [shafi] http://lxr.free-electrons.com/source/drivers/net/wireless/ath/ath10k/debugfs_sta.c#L144
> yes WMI command is sent to f/w
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
