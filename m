Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvRpb-0007cF-F1
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 14:20:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 7/7] ath10k: implement wmi-tlv backend
References: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
 <1417079481-22255-8-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQn=g8-=FEEoW7Ux+p6s=EBy_3rwCP3qXWk_8ijR6jXY+Q@mail.gmail.com>
Date: Mon, 1 Dec 2014 16:19:23 +0200
In-Reply-To: <CA+BoTQn=g8-=FEEoW7Ux+p6s=EBy_3rwCP3qXWk_8ijR6jXY+Q@mail.gmail.com>
 (Michal Kazior's message of "Fri, 28 Nov 2014 15:39:01 +0100")
Message-ID: <87wq6bpi50.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 27 November 2014 at 10:11, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Latest main firmware branch introduced a new WMI
>> ABI called wmi-tlv. It is not a tlv strictly
>> speaking but something that resembles it because
>> it is ordered and may have duplicate id entries.
>>
>> This prepares ath10k to support new hw.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> [...]
>> @@ -215,6 +254,42 @@ static inline char *wmi_service_name(int service_id)
>>         SVCSTR(WMI_SERVICE_BURST);
>>         SVCSTR(WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT);
>>         SVCSTR(WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT);
>> +       SVCSTR(WMI_SERVICE_ROAM_SCAN_OFFLOAD);
>> +       SVCSTR(WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC);
>> +       SVCSTR(WMI_SERVICE_EARLY_RX);
> [...]
>> +       SVCSTR(WMI_SERVICE_RX_FULL_REORDER);
>> +       SVCSTR(WMI_SERVICE_DHCP_OFFLOAD);
>
> I've added 3 new service enums in v2:
> WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT, WMI_SERVICE_MDNS_OFFLOAD,
> WMI_SERVICE_SAP_AUTH_OFFLOAD but apparently I forgot to add SVCSTR()
> for that..

I added those in my not-yet-submitted v3:

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a31a3028a847..7d091a74d3f3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -290,6 +290,9 @@ static inline char *wmi_service_name(int service_id)
        SVCSTR(WMI_SERVICE_ROAM_HO_OFFLOAD);
        SVCSTR(WMI_SERVICE_RX_FULL_REORDER);
        SVCSTR(WMI_SERVICE_DHCP_OFFLOAD);
+       SVCSTR(WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT);
+       SVCSTR(WMI_SERVICE_MDNS_OFFLOAD);
+       SVCSTR(WMI_SERVICE_SAP_AUTH_OFFLOAD);
        default:
                return NULL;
        }


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
