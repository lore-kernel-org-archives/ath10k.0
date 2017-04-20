Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d15fh-0000ZJ-Sh
 for ath10k@lists.infradead.org; Thu, 20 Apr 2017 06:34:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: odd msg using kvalo firmware-5.bin w/ KillerAC 1535(QCA6174)
Date: Thu, 20 Apr 2017 06:34:00 +0000
Message-ID: <87a87b7fl4.fsf@kamboji.qca.qualcomm.com>
References: <2103690e-ad1f-4612-e343-1ea711c14a00@linaro.org>
 <1492660230116.11983@qti.qualcomm.com>
In-Reply-To: <1492660230116.11983@qti.qualcomm.com> (Mohammed Shafi
 Shajakhan's message of "Thu, 20 Apr 2017 03:50:30 +0000")
Content-Language: en-US
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
To: "Mohammed Shafi Shajakhan (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Michael Scott <michael.scott@linaro.org>

(please don't top post)

"Mohammed Shafi Shajakhan (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
writes:

> my quick analysis suggests this belongs to
> 'WMI_TLV_GRP_STATS' 
>
> WMI_TLV_STATS_EXT_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_STATS), equals to 90112 (0x16000)
>         WMI_TLV_IFACE_LINK_STATS_EVENTID, 90113
>         WMI_TLV_PEER_LINK_STATS_EVENTID, 90114
>         WMI_TLV_RADIO_LINK_STATS_EVENTID, 90015
>              .... ?
>         WMI_TLV_NLO_MATCH_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_NLO_OFL),


I checked and I think this is a some kind of RSSI stats event. I assume
that's a new feature coming from RM.4.4 branch. (Michael said on IRC he
is not seeing that with RM.2.0 branch.)

> but this should be a harmless warning message indicating the host had not implemented
> any action for this particular event.
>
> For example in 10.2 wmi.c
>
>
>    case WMI_10_2_GPIO_INPUT_EVENTID:
>         case WMI_10_2_PEER_RATECODE_LIST_EVENTID:
>         case WMI_10_2_GENERIC_BUFFER_EVENTID:
>         case WMI_10_2_MCAST_BUF_RELEASE_EVENTID:
>         case WMI_10_2_MCAST_LIST_AGEOUT_EVENTID:
>         case WMI_10_2_WDS_PEER_EVENTID:
>                 ath10k_dbg(ar, ATH10K_DBG_WMI,
>                            "received event id %d not implemented\n", id);
>                 break;

Yes, it's harmless but ath10k should not print that warning to not
distract the users. Can someone make a patch to silent the warning that
similarly like with WMI_10_2_WDS_PEER_EVENTID above?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
