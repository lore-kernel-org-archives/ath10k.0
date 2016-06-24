Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGHmf-0007GV-40
 for ath10k@lists.infradead.org; Fri, 24 Jun 2016 03:27:58 +0000
Received: by mail-it0-x230.google.com with SMTP id h190so5443292ith.1
 for <ath10k@lists.infradead.org>; Thu, 23 Jun 2016 20:27:36 -0700 (PDT)
From: Tom Marble <tmarble@info9.net>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
In-Reply-To: <CABkMH_rZNhxHtfaD3pz0ymSjvEKGxDycjDcwxKBZFKj8j2P_Jg@mail.gmail.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com> <57dd1n9mks5.fsf@cerise.info9.net>
 <87r3bpfh94.fsf@kamboji.qca.qualcomm.com> <57doa6skql6.fsf@cerise.info9.net>
 <CABkMH_rZNhxHtfaD3pz0ymSjvEKGxDycjDcwxKBZFKj8j2P_Jg@mail.gmail.com>
Date: Thu, 23 Jun 2016 22:27:20 -0500
Message-ID: <57dfus3l10n.fsf@cerise.info9.net>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0568488414212516808=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tomasz Skapski <tomasz.skapski@tieto.com>
Cc: Tom Marble <tmarble@info9.net>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============0568488414212516808==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Tomasz Skapski <tomasz.skapski@tieto.com> writes:
> In your config file set 'fragm_threshold=-1', or comment it.

Indeed this was the last critical configuration change...
Now I'm able to bring up the interface!

Then I was getting errors when 'ifup'-ing the interface
  RTNETLINK answers: File exists
which were resolved by ensuring that
1. The interface was flushed prior to being up'ed
   ip addr flush dev wlan0
2. The interface was *not* configured to add an (additional) gateway

Following this the interface would not stay up due to avahi-daemon
decideding it didn't like something and removing the address
  avahi-daemon[2925]: Withdrawing address record for 10.6.8.1 on wlan0.

The solution here was just removing avahi-daemon (and mDNS services).

Then the interface wasn't happy about IPv6
  IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not read

Even with setting (in /etc/hostapd/wlan0.conf ) this problem still occurred.
  ipaddr_type_availability=32

The solution was disabling IPv6 (at least for now.. I do want IPv6
eventually), in /etc/sysctl.conf
# NO IPV6                                                                        net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.eth0.disable_ipv6 = 1
net.ipv6.conf.wan0.disable_ipv6 = 1

I also rebuilt hostapd because it seems to have a version locked
dependency of libssl (for some reason?).

With the addition of dnsmasq (for DHCP and DNS proxying) and
simple nftables rules for nat/masquerade I now have a functioning AP!

Certain clients seemed to get "kicked off" the network which has
been mitigated by setting:
  ap_max_inactivity=600
  disassoc_low_ack=0

One problem that results in clients getting removed from the AP is:
Jun 23 19:07:28 six kernel: [  995.006727] wlan0: dropped frame to 00:01:02:03:37:15 (unauthorized port)

... and I'm not sure what's causing that?

Amusingly certain Android clients seem to constantly "fishing" to find
active networks (these messages occur every 15 seconds):
Jun 23 21:26:23 six kernel: [ 9330.082522] wlan1: STA 00:01:02:03:37:15 aid 1 enters power save mode
Jun 23 21:26:38 six kernel: [ 9345.059365] wlan1: STA 00:01:02:03:37:15 aid 1 exits power save mode
Jun 23 21:26:38 six kernel: [ 9345.059408] wlan1: STA 00:01:02:03:37:15 aid 1 sending 0 filtered/0 PS frames since STA \
not sleeping anymore
Jun 23 21:26:39 six kernel: [ 9345.364866] wlan1: STA 00:01:02:03:37:15 aid 1 enters power save mode

In other good news I added a second nic (wlan1) to handle 2.4 GHz
traffic in the form of a TP-LINK TL-WN722N which is supported by
the driver ath9k_htc. Using a separate instance of hostapd for wlan1
I now have a dual mode access point!

I found I had to move the TL-WN722N antenna as far away as possible
to minimize interference with the 5 GHz signal.

One strange thing I've noticed is that if I configure the wlan0 (5 GHz)
channel=52 on boot up it doesn't work... However if I have once
done channel=0 then on subsequent bounces of the interface I can have
it come up on a specific channel.

Thanks Tomasz and Kalle for your help!!!

--Tom



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXbKiZAAoJEEC/7oaLBV2anTkP/3NSnKkFAp3sAbIigd0/qB9u
42rTT3joKeV72jijMFIvHepN97ybr0vFxgazjAfFDu57B2a728gM/TCFkMlcZkKk
tch0Qm7Zu4+DGFyKPGxfdyguiF/ncSJBwvcuuqYW0thl26JsS6i7+tiWp1fg+k8v
5+1kfne7DgCRoFQbccYARi1xTX6Cv7Z/8rZmhTgirRw5y8MHAf9Afhu2Kp5Gly1d
dt/FrfNzHWtNklBh6t1SrDZiYgKoi6FY7CIQF4g0qtXny0vZG4X/xtczQEZYlQNW
a1r/RM97rt5Sn35PgDaSpTV3E9GD/0+QLy6wQL8Z7vyNJSwpNVtaQT1XD/Vn2FB9
mHMqXUvulPaZYsCp+6BKHl9obQHlTyJjyJaxFRHhmmKule74nl36T8J6khDpb/7T
a1Ysm9EtbwHxAhVnKYDe8f5ibgtmAyFXe9UO96lz/L/7FDqsikBueYu3EQ6P2y6f
EyXrhjEyM6CQ7FbQjTry8/gjuoyiClfuimrL+sglOWCO7Cfq135TJExx0cRCR12U
LvNg58nxI7w5tqvLbBUXKCDZ2SSw7v/8pUK5BQmOxuDXqdBn1NlGYfKu1uAgwdtv
vi0/hDL18MMYB8bQ4iFuOQpAavvMsmO7AlEvZiTcZhQ21RYXFkQ2C1/neom16uRP
VmQ3sNs3xLdL+qXZ7NBP
=p4vj
-----END PGP SIGNATURE-----
--=-=-=--


--===============0568488414212516808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0568488414212516808==--
