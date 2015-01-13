Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB2GM-0005lx-QX
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 14:16:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/8] ath10k: add per station debugfs support
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 13 Jan 2015 16:15:34 +0200
In-Reply-To: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 24 Dec 2014 13:29:01 +0530")
Message-ID: <87twzu6a2h.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> The following patches add support for sending addba/addba response/delba
> for every station entries. These commands are purely for testing purpose.
>
> Before using any of the above aggregation commands, the mode should be moved
> to manual. To disable automatic aggretation in target
>
> echo 1 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>         stations/XX:XX:XX:XX:XX:XX/aggr_mode
>
> Then for sending addba request,
>
> echo 1 32 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>         stations/XX:XX:XX:XX:XX:XX/addba
>
> To send addba response,
>
> echo 0 25 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>         stations/XX:XX:XX:XX:XX:XX/addba_resp
>
> And for delba,
>
> echo 0 1 37 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>         stations/XX:XX:XX:XX:XX:XX/delba
>
> v2: Rebased on top of 10.2.4 WMI ops support
>
> Rajkumar Manoharan (8):
>   ath10k: add wmi support for addba_clear_resp
>   ath10k: add wmi support for addba_send
>   ath10k: add wmi support for addba_set_resp
>   ath10k: add wmi support for delba_send
>   ath10k: Implement sta_add_debugfs
>   ath10k: add support to send addba request
>   ath10k: add support to send addba response
>   ath10k: add support to send delba

Thanks, all eight patches applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
