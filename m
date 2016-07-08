Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLZtO-0000Km-Qr
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 17:48:47 +0000
Message-ID: <577FE767.3020200@codeaurora.org>
Date: Fri, 08 Jul 2016 10:48:23 -0700
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: Does 99x0 support mesh mode?
References: <CAGJdtRASjA_+HPh1zFkoF4V=ttWcidxEwDAOU+ehbc7YhSxw7A@mail.gmail.com>
 <CAEFj984kqhY5zM_S=CLfDdujbpmwsrKqzZx=xm1AyCPQcmWWKg@mail.gmail.com>
In-Reply-To: <CAEFj984kqhY5zM_S=CLfDdujbpmwsrKqzZx=xm1AyCPQcmWWKg@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, Yu-Chieh <jay0607@gmail.com>
Cc: ath10k@lists.infradead.org


On 07/08/2016 10:15 AM, Yeoh Chun-Yeow wrote:
> Make sure the firmware has the raw mode feature bit enabled to support
> mesh.
In addition to that, you may check out wmi_services (cat 
/sys/kernel/debug/ieee80211/phyX/ath10k/wmi_services) if 
WMI_SERVICE_MESH_11S is set to enabled which means 11s mesh supported in 
native Wi-Fi mode.
> ---
> Chun-Yeow
>
> On Fri, Jul 8, 2016 at 12:52 PM, Yu-Chieh <jay0607@gmail.com> wrote:
>> Hi,
>>
>> Does anyone know if current firmware support mesh mode(802.11s) on 99x0?
>>
>> Best regards,
>>
>> Jay
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
