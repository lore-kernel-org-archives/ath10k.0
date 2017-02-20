Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfp6b-0000vU-8j
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 14:38:24 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: who care of addba/delba in ath10k?
Date: Mon, 20 Feb 2017 14:37:51 +0000
Message-ID: <1487601470622.92250@qti.qualcomm.com>
References: <1beccb9973bd869d9cadd0b6823ce854@cweb06.nm.nhnsystem.com>
In-Reply-To: <1beccb9973bd869d9cadd0b6823ce854@cweb06.nm.nhnsystem.com>
Content-Language: en-IN
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, KwangMin Kim <kim25444@naver.com>
Cc: "gwondori@nimbus.kr" <gwondori@nimbus.kr>

I think that ath10k's addba / delba is doing firmware. Is this right?

[shafi] http://lxr.free-electrons.com/source/drivers/net/wireless/ath/ath10k/debugfs_sta.c#L144 
yes WMI command is sent to f/w
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
