Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHVsb-0001IE-7C
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 12:43:10 +0000
Received: by mail-it0-x22e.google.com with SMTP id a5so64361541ita.1
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 05:42:47 -0700 (PDT)
From: Tom Marble <tmarble@info9.net>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
In-Reply-To: <CA+BoTQnevnhYg2aXWJWRESADJ_dkDHNg3KGjpP=0-aAjmjKcDg@mail.gmail.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com> <57dd1n9mks5.fsf@cerise.info9.net>
 <87r3bpfh94.fsf@kamboji.qca.qualcomm.com> <57doa6skql6.fsf@cerise.info9.net>
 <CABkMH_rZNhxHtfaD3pz0ymSjvEKGxDycjDcwxKBZFKj8j2P_Jg@mail.gmail.com>
 <57dfus3l10n.fsf@cerise.info9.net>
 <CA+BoTQnevnhYg2aXWJWRESADJ_dkDHNg3KGjpP=0-aAjmjKcDg@mail.gmail.com>
Date: Mon, 27 Jun 2016 07:42:44 -0500
Message-ID: <57da8i6sszf.fsf@cerise.info9.net>
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
Cc: tmarble@info9.net, "Valo, Kalle" <kvalo@qca.qualcomm.com>, Tomasz Skapski <tomasz.skapski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:
> On 24 June 2016 at 05:27, Tom Marble <tmarble@info9.net> wrote:
>> The solution here was just removing avahi-daemon (and mDNS services).
>>
>> Then the interface wasn't happy about IPv6
>>   IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not read
>
> This is normal. Try down/up your ethernet interface and you'll see the
> same thing.

Ok.

>> Even with setting (in /etc/hostapd/wlan0.conf ) this problem still occurred.
>>   ipaddr_type_availability=32
>>
>> The solution was disabling IPv6 (at least for now.. I do want IPv6
>> eventually), in /etc/sysctl.conf
>> # NO IPV6                                                                        net.ipv6.conf.all.disable_ipv6 = 1
>> net.ipv6.conf.default.disable_ipv6 = 1
>> net.ipv6.conf.lo.disable_ipv6 = 1
>> net.ipv6.conf.eth0.disable_ipv6 = 1
>> net.ipv6.conf.wan0.disable_ipv6 = 1
>
> Do you really need to disable ipv6?

No.. I *want* IPv6! I'm going to try adding it back in now
to see if I can get it to work.

>> Certain clients seemed to get "kicked off" the network which has
>> been mitigated by setting:
>>   ap_max_inactivity=600
>>   disassoc_low_ack=0
>
> Try using disassoc_low_ack=1 which enables station inactivity
> detection up to firmware/driver (there are some bugs with sending
> nullfunc frames depending on fw/hw/driver combo).

I'll try that!

>> One strange thing I've noticed is that if I configure the wlan0 (5 GHz)
>> channel=52 on boot up it doesn't work... However if I have once
>> done channel=0 then on subsequent bounces of the interface I can have
>> it come up on a specific channel.
>
> (haven't followed the entire thread, so sorry if I re-iterate something).
>
> Channel availability can get messy and quirky (unless that has changed
> in recent kernels?) with multiple wireless cards on the same system.
> So there's that.

I realize this can be tricky. My current thought is to bring
up wlan0 (5 GHz) first and then bring up wlan1 (2.4 GHz).

I'll report my findings after my next round of tests.

Thanks!

--Tom

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
