Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRLjI-0001dj-Mu
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 14:49:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fill in wmi 10.4 command handlers for addba/delba
 debug commands
References: <1439480454-31214-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Mon, 17 Aug 2015 17:49:13 +0300
In-Reply-To: <1439480454-31214-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Thu, 13 Aug 2015 21:10:54
 +0530")
Message-ID: <87a8tqdl7a.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> WMI 10.4 uses the same command interface as QCA988X for addba/delba
> debug wmi commands. Fill wmi_10_4_ops table with the functions used
> for QCA988X for these commands.
>
> With this change, the following debugfs entries can be used to
> configure the aggregation mode and to send addba request,
> addba response and delba respectively in manual aggregation mode
> for QCA99X0 chip.
>
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/aggr_mode
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/addba
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/addba_resp
> /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/delba
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
