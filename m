Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAXOz-0007HV-EM
 for ath10k@lists.infradead.org; Thu, 02 Jul 2015 05:51:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/8] add beacon and htt msg support for 10.4 firmware
References: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
Date: Thu, 2 Jul 2015 08:50:44 +0300
In-Reply-To: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Mon, 22 Jun 2015 20:22:19 +0530")
Message-ID: <87k2uj151n.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> This is the continuation of earlier patch set posted for adding 10.4 wmi support.
> This patch series covers following items w.r.t 10.4 firmware,
>
>         - Enhance existing swba event handler to handle variable size tim bitmap
>           and add support to handle 10.4 swba event.
>         - Enable pdev, vdev, peer related wmi operations like create, delete, etc.
>         - Includes scan support.
>         - Add 10.4 specific htt msg.
>         - Advertise 10.4 iface combination to mac80211.
>         - Adjust max ss and initialize continuous frag descriptor memory
>
> v2 changes:
>        - rebased on top of "introduce wmi support for qca99x0" patch series.
>        - updated htt msg definitions as per stable 10.4 firmware.
>        - synced scan related info as per stable 10.4 firmware.
>
> Raja Mani (8):
>   ath10k: enhance swba event handler to adapt different size tim bitmap
>   ath10k: handle 10.4 firmware wmi swba event
>   ath10k: enable vdev and peer related operations for 10.4 fw
>   ath10k: add scan support for 10.4 fw
>   ath10k: add 10.4 fw specific htt msg definitions
>   ath10k: advertise 10.4 fw ap and sta iface combination to mac80211
>   ath10k: set max spatial stream to 4 for 10.4 fw
>   ath10k: configure frag desc memory to target for qca99X0

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
