Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzm05-0004pH-OC
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 15:54:23 +0000
Received: by mail-lf0-x241.google.com with SMTP id l196so4920347lfl.3
 for <ath10k@lists.infradead.org>; Wed, 04 Oct 2017 08:53:59 -0700 (PDT)
Subject: Re: [PATCH 00/11] SDIO support for ath10k
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <b4bbf022-77d7-f907-f35b-7afacfc227e5@gmail.com>
 <59D47E1B.5000009@silex-india.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <045fef88-855e-0590-eec6-488762b3cfd6@gmail.com>
Date: Wed, 4 Oct 2017 17:53:56 +0200
MIME-Version: 1.0
In-Reply-To: <59D47E1B.5000009@silex-india.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Alagu Sankar <alagusankar@silex-india.com>, silexcommon@gmail.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 2017-10-04 08:22, Alagu Sankar wrote:
> Hi Erik,
> =

> We will work to have this support mainlined as soon as possible. Would ap=
preciate your support
> in making sure that the patches do not affect the USB high latency path.
> =

I have added the patches in my own ath-repo and I have tested with the
WUSB6100M without any problems.

> On 02-10-2017 14:32, Erik Stromdahl wrote:
>> Hi Alagu,
>>
>> It is great to see that we are finally about have fully working
>> mainline support for QCA9377 SDIO chipsets!
>>
>> Great job!
>>
>> On 2017-09-30 19:37, silexcommon@gmail.com wrote:
>>> From: Alagu Sankar <alagusankar@silex-india.com>
>>>
>>> This patchset, generated against master-pending branch, enables a fully
>>> functional SDIO interface driver for ath10k.=A0 Patches have been verif=
ied on
>>> QCA9377-3 WB396 and Silex's SX-SDCAC reference cards with Station, Acce=
ss Point
>>> and P2P modes.
>>>
>>> The driver is verified with the firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1
>>> with the board data from respective SDIO card vendors. Receive performa=
nce
>>> matches the QCA reference driver when used with SDIO3.0 enabled platfor=
ms.
>>> iperf tests indicate a downlink UDP of 275Mbit/s and TCP of 150Mbit/s
>>>
>> Can you share any scripts etc. (wrapping hostapd and wpa_supplicant stuf=
f)
>> or provide some more info about you test setup?
>>
> I am not using any specific scripts for this. The standard ones from the =
ath10k configuration page
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/configuration wo=
rks just fine with the
> NL80211 path.
>> I made a quick socat based test on an old laptop (I don't think it has S=
DIO
>> 3.0 support) and I did unfortunately not get the same figures as you did=
 :(
>>
> If it is SDIO v1.x, then the max bus speed is only 100Mbit/s.=A0 With v2.=
x it is 200Mbit/s and 3.x it is
> 832 Mbit/s.=A0 Throughput primarily depends on it. We used i.MX6 SoloX Sa=
bre SDB platform
> which supports SDIO3.x and could see the maximum performance.
>>> This patchset differs from the previous high latency patches, specific =
to SDIO.
>>> HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET is enabled for HI_ACS. This instr=
ucts the
>>> firmware to use HTT_T2H_MSG_TYPE_TX_COMPL_IND for outgoing packets. Wit=
hout
>>> this flag, the management frames are not sent out by the firmware. Poss=
ibility
>>> of management frames being sent via WMI and data frames through the red=
uced Tx
>>> completion needs to be probed further.
>>>
>> Ah, so that explains why I couldn't see any messages in the air.
>>
>>> Further improvements can be done on the transmit path by implementing p=
acket
>>> bundle. Scatter Gather is another area of improvement for both Transmit=
 and
>>> Receive, but may not work on all platforms
>>>
>>> Known issues: Surprise removal of the card, when the device is in conne=
cted
>>> state, delays sdio function remove due to delayed WMI command failures.
>>> Existing ath10k framework can not differentiate between a kernel module
>>> removal and the surprise removal of teh card.
>>>
>>> Alagu Sankar (11):
>>> =A0=A0 ath10k_sdio: sdio htt data transfer fixes
>>> =A0=A0 ath10k_sdio: wb396 reference card fix
>>> =A0=A0 ath10k_sdio: DMA bounce buffers for read write
>>> =A0=A0 ath10k_sdio: reduce transmit msdu count
>>> =A0=A0 ath10k_sdio: use clean packet headers
>>> =A0=A0 ath10k_sdio: high latency fixes for beacon buffer
>>> =A0=A0 ath10k_sdio: fix rssi indication
>>> =A0=A0 ath10k_sdio: common read write
>>> =A0=A0 ath10k_sdio: virtual scatter gather for receive
>>> =A0=A0 ath10k_sdio: enable firmware crash dump
>>> =A0=A0 ath10k_sdio: hif start once addition
>>>
>>> =A0 drivers/net/wireless/ath/ath10k/core.c=A0=A0=A0 |=A0 35 ++-
>>> =A0 drivers/net/wireless/ath/ath10k/debug.c=A0=A0 |=A0=A0 3 +
>>> =A0 drivers/net/wireless/ath/ath10k/htc.c=A0=A0=A0=A0 |=A0=A0 4 +-
>>> =A0 drivers/net/wireless/ath/ath10k/htc.h=A0=A0=A0=A0 |=A0=A0 1 +
>>> =A0 drivers/net/wireless/ath/ath10k/htt_rx.c=A0 |=A0 19 +-
>>> =A0 drivers/net/wireless/ath/ath10k/htt_tx.c=A0 |=A0 24 +-
>>> =A0 drivers/net/wireless/ath/ath10k/hw.c=A0=A0=A0=A0=A0 |=A0=A0 2 +
>>> =A0 drivers/net/wireless/ath/ath10k/hw.h=A0=A0=A0=A0=A0 |=A0=A0 1 +
>>> =A0 drivers/net/wireless/ath/ath10k/mac.c=A0=A0=A0=A0 |=A0 31 ++-
>>> =A0 drivers/net/wireless/ath/ath10k/sdio.c=A0=A0=A0 | 398 +++++++++++++=
+++++++++--------
>>> =A0 drivers/net/wireless/ath/ath10k/sdio.h=A0=A0=A0 |=A0 10 +-
>>> =A0 drivers/net/wireless/ath/ath10k/wmi-tlv.c |=A0=A0 2 +-
>>> =A0 12 files changed, 403 insertions(+), 127 deletions(-)
>>>
>>
> =


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
