Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d13I9-0006qp-KE
 for ath10k@lists.infradead.org; Thu, 20 Apr 2017 04:02:03 +0000
Received: by mail-wm0-x229.google.com with SMTP id m123so26415974wma.0
 for <ath10k@lists.infradead.org>; Wed, 19 Apr 2017 21:01:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492660230116.11983@qti.qualcomm.com>
References: <2103690e-ad1f-4612-e343-1ea711c14a00@linaro.org>
 <1492660230116.11983@qti.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 19 Apr 2017 21:01:38 -0700
Message-ID: <CAJ-Vmo=wwBYGkZY55Ugggz8WrPe-rJ5eShEi-dy7dWhJCo8UmQ@mail.gmail.com>
Subject: Re: odd msg using kvalo firmware-5.bin w/ KillerAC 1535(QCA6174)
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Michael Scott <michael.scott@linaro.org>

does the newer firmware expect something ath10k isn't supplying? I
found (when porting ath10k to freebsd) that rome is pickier when it
comes to commands being sent and requires commands that 10.2 on
peregrine was less picky about.



-adrian


On 19 April 2017 at 20:50, Mohammed Shafi Shajakhan (Mohammed Shafi)
<mohammed@qti.qualcomm.com> wrote:
> Hi,
>
> my quick analysis suggests this belongs to
> 'WMI_TLV_GRP_STATS'
>
> WMI_TLV_STATS_EXT_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_STATS), equals to 90112 (0x16000)
>         WMI_TLV_IFACE_LINK_STATS_EVENTID, 90113
>         WMI_TLV_PEER_LINK_STATS_EVENTID, 90114
>         WMI_TLV_RADIO_LINK_STATS_EVENTID, 90015
>              .... ?
>         WMI_TLV_NLO_MATCH_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_NLO_OFL),
>
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
>
>
> ________________________________________
> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Michael Scott <michael.scott@linaro.org>
> Sent: 20 April 2017 00:07
> To: ath10k@lists.infradead.org
> Cc: Kalle Valo
> Subject: odd msg using kvalo firmware-5.bin w/ KillerAC 1535(QCA6174)
>
> I am currently testing a QCA6174-based M.2/NGFF card (KillerAC 1535) w/
> linux-next kernel.  When I use the firmware-5.bin from Kalle Valo's
> github: https://github.com/kvalo/ath10k-firmware, I see the following
> message occasionally in dmesg:
> ath10k_pci 0000:01:00.0: Unknown eventid: 90118
>
> If I revert back to firmware-4.bin, that message goes away.
>
> (Spoke with kvalo on IRC and passing this info along to the list)
>
> - Mike
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
