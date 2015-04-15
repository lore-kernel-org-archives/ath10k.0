Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiFRa-0005d8-17
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 05:00:58 +0000
Received: by iget9 with SMTP id t9so88881456ige.1
 for <ath10k@lists.infradead.org>; Tue, 14 Apr 2015 22:00:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFuUQkhQeCwP098DH7_R4mNCvrJ7WxdT7wnHi52DSOKm8c0k1Q@mail.gmail.com>
References: <1428911141-6534-1-git-send-email-janusz.dziedzic@tieto.com>
 <1428911141-6534-2-git-send-email-janusz.dziedzic@tieto.com>
 <CAFuUQkhQeCwP098DH7_R4mNCvrJ7WxdT7wnHi52DSOKm8c0k1Q@mail.gmail.com>
Date: Wed, 15 Apr 2015 07:00:32 +0200
Message-ID: <CALhHN=pefUssihniviRiBWg+EU2wYp3excwodJBDt1+H0tiiHQ@mail.gmail.com>
Subject: Re: [RFC 2/2] ath10k: don't disable PS when not connected
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: YanBo <dreamfly281@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 15 April 2015 at 00:45, YanBo <dreamfly281@gmail.com> wrote:
> On Mon, Apr 13, 2015 at 12:45 AM, Janusz Dziedzic
> <janusz.dziedzic@tieto.com> wrote:
>> Don't disable PS while we are not connected.
>> In other case we will get higher power consumption.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 52c5b1f..b896dd4 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -1730,7 +1730,13 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
>>                 enable_ps = false;
>>         }
>>
>> -       if (enable_ps) {
>> +       if (!arvif->is_started) {
>> +               /* enable power save mode while not connected,
>> +                * in other case after iface up we will get
>> +                * higher power consumption - firmware design
>> +                */
>> +               psmode = WMI_STA_PS_MODE_ENABLED;
>> +       } else if (enable_ps) {
>>                 psmode = WMI_STA_PS_MODE_ENABLED;
>>                 param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
>>
>> --
>
> What the expectation behavior after we enable the
> WMI_STA_PS_MODE_ENABLED at Idle status?
> Is there any effect for TX or RX chain after set it?
>

First I think that WMI_STA_PS_MODE_ENABLED is important only when we
are connected.
But, I see current consumption drop in my test environtment from 88mA
to 33mA when:
1) load driver, iface up
2) disconnect network, iface down, iface up
So, seems WMI_STA_PS_MODE_ENABLED do something more in FW (not only
standard PS enable/disable when
connected to AP). Probably someone from FW team should answer that, if
that is a feature or a bug.

BTW.
Patch don't change behavior we had before, when we are connected. We
can enable/disable PS using iw.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
