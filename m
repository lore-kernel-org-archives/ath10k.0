Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYat9-0002WM-2x
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 13:53:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: strip qos data bit always
References: <1426080326-14764-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 19 Mar 2015 15:53:00 +0200
In-Reply-To: <1426080326-14764-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 11 Mar 2015 14:25:26 +0100")
Message-ID: <871tkljdqb.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> NativeWifi tx mode expects QoS Data frames to be
> delivered as Data frames with QoS part (e.g. tid)
> being delievered out-of-band in fw tx command.
>
> The QoS bit wasn't stripped before submitting to
> firmware.
>
> Stripping fixes two known problems:
>
>  * qca6174 IOT with some APs, e.g.
>    Cisco AIR-AP 1252 (which would crash after
>    ath10k association). Some ath9k APs would
>    crash as well.
>
>  * sniffing own tx frames via radiotap because,
>    e.g. wireshark was seeing QoS bit set but
>    since QoS Control was stripped in ath10k it
>    would parse beginning of LLC/SNAP
>
>>From debugability point of view this removes the
> ability to distinguish QoS from non-QoS frames
> when sniffing own tx via radiotap. On the other
> hand frames can be now parsed correctly without
> special software modification.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
