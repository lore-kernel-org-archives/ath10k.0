Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHV5p-0004KA-7F
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 11:52:46 +0000
Received: by mail-wm0-x233.google.com with SMTP id a66so111581411wme.0
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 04:52:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57dfus3l10n.fsf@cerise.info9.net>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com>
 <57dd1n9mks5.fsf@cerise.info9.net> <87r3bpfh94.fsf@kamboji.qca.qualcomm.com>
 <57doa6skql6.fsf@cerise.info9.net>
 <CABkMH_rZNhxHtfaD3pz0ymSjvEKGxDycjDcwxKBZFKj8j2P_Jg@mail.gmail.com>
 <57dfus3l10n.fsf@cerise.info9.net>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 27 Jun 2016 13:52:22 +0200
Message-ID: <CA+BoTQnevnhYg2aXWJWRESADJ_dkDHNg3KGjpP=0-aAjmjKcDg@mail.gmail.com>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
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
To: Tom Marble <tmarble@info9.net>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Tomasz Skapski <tomasz.skapski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 24 June 2016 at 05:27, Tom Marble <tmarble@info9.net> wrote:
> Tomasz Skapski <tomasz.skapski@tieto.com> writes:
>> In your config file set 'fragm_threshold=-1', or comment it.
>
> Indeed this was the last critical configuration change...
> Now I'm able to bring up the interface!
>
> Then I was getting errors when 'ifup'-ing the interface
>   RTNETLINK answers: File exists
> which were resolved by ensuring that
> 1. The interface was flushed prior to being up'ed
>    ip addr flush dev wlan0
> 2. The interface was *not* configured to add an (additional) gateway
>
> Following this the interface would not stay up due to avahi-daemon
> decideding it didn't like something and removing the address
>   avahi-daemon[2925]: Withdrawing address record for 10.6.8.1 on wlan0.
>
> The solution here was just removing avahi-daemon (and mDNS services).
>
> Then the interface wasn't happy about IPv6
>   IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not read

This is normal. Try down/up your ethernet interface and you'll see the
same thing.


> Even with setting (in /etc/hostapd/wlan0.conf ) this problem still occurred.
>   ipaddr_type_availability=32
>
> The solution was disabling IPv6 (at least for now.. I do want IPv6
> eventually), in /etc/sysctl.conf
> # NO IPV6                                                                        net.ipv6.conf.all.disable_ipv6 = 1
> net.ipv6.conf.default.disable_ipv6 = 1
> net.ipv6.conf.lo.disable_ipv6 = 1
> net.ipv6.conf.eth0.disable_ipv6 = 1
> net.ipv6.conf.wan0.disable_ipv6 = 1

Do you really need to disable ipv6?


> I also rebuilt hostapd because it seems to have a version locked
> dependency of libssl (for some reason?).
>
> With the addition of dnsmasq (for DHCP and DNS proxying) and
> simple nftables rules for nat/masquerade I now have a functioning AP!
>
> Certain clients seemed to get "kicked off" the network which has
> been mitigated by setting:
>   ap_max_inactivity=600
>   disassoc_low_ack=0

Try using disassoc_low_ack=1 which enables station inactivity
detection up to firmware/driver (there are some bugs with sending
nullfunc frames depending on fw/hw/driver combo).


[...]
> One strange thing I've noticed is that if I configure the wlan0 (5 GHz)
> channel=52 on boot up it doesn't work... However if I have once
> done channel=0 then on subsequent bounces of the interface I can have
> it come up on a specific channel.

(haven't followed the entire thread, so sorry if I re-iterate something).

Channel availability can get messy and quirky (unless that has changed
in recent kernels?) with multiple wireless cards on the same system.
So there's that.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
