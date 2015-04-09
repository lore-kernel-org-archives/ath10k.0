Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.tech.numericable.fr ([82.216.111.37])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yg81m-0001i2-0w
 for ath10k@lists.infradead.org; Thu, 09 Apr 2015 08:41:35 +0000
Message-ID: <55263B1C.4020708@green-communications.fr>
Date: Thu, 09 Apr 2015 10:41:00 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
Subject: Re: Getting bad MIC when trying ath10k + ath9k IBSS with RSN
References: <552470C7.9040002@candelatech.com>
 <5524F0E9.9030208@green-communications.fr> <55254106.7040807@candelatech.com>
 <5525B8F3.4050702@candelatech.com>
In-Reply-To: <5525B8F3.4050702@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: hostap@lists.shmoo.com, ath10k@lists.infradead.org

[re-adding ath10k, sorry for removing it]

On 09/04/2015 01:25, Ben Greear wrote:
> On 04/08/2015 07:53 AM, Ben Greear wrote:
> Ok, the EAPOL seems to work now, as long as I restart both supplicants before
> I try to connect.
> 
> It appears now that there is something wrong with setting the keys.  The
> firmware appears to get a real key, and then shortly after, the keys are
> removed and encryption is disabled.
> 
> The supplicant log is below.  I believe the crucial part is this.  Any idea why
> this would be failing?  (I'll poke in the kernel tomorrow to try to find
> the reason as well...)
> 
> 1428534417.236258: wpa_driver_nl80211_set_key: ifindex=131 (wlan0) alg=3 addr=0x2344900 key_idx=1 set_tx=0 seq_len=6 key_len=16
> 1428534417.236273: nl80211: KEY_DATA - hexdump(len=16): a5 28 f3 02 e9 cb a4 de 87 01 a4 9c c9 d2 a8 89
> 1428534417.236298: nl80211: KEY_SEQ - hexdump(len=6): 00 00 00 00 00 00
> 1428534417.236311:    addr=00:0e:8e:3e:8b:96
> 1428534417.236319:    RSN IBSS RX GTK
> 1428534417.236355: nl80211: set_key failed; err=-22 Invalid argument)
> 1428534417.236367: wlan0: WPA: Failed to set GTK to the driver (alg=3 keylen=16 keyidx=1)
> 1428534417.236376: wlan0: RSN: Failed to install GTK
> 1428534417.236385: wlan0: RSN: Failed to configure GTK
> 1428534417.236393: SUPP: supp_deauthenticate (TODO)
> 1428534417.236419: l2_packet_receive: src=00:0e:8e:3e:8b:96 len=99

I see this failure with drivers that do not support IBSS-RSN...
Otherwise, this request must succeed.

The only difference between AP mode and IBSS mode is that in IBSS mode,
each peer have their own GTK, so you have to program a per-sta GTK for
decryption.

But GTK is for multicast frames, and I already made broken IBSS-RSN
networks with drivers that do not support IBSS-RSN, because the PTK was
still programmed correctly. You just have a network that can only pass
unicast traffic.  Your PTK was programmed correctly:

1428534380.576614: AUTH: set_key - key - hexdump(len=16): 99 76 89 40 b3
61 28 4f 60 2c 4b 75 72 6b 4e e8
1428534380.576645: wpa_driver_nl80211_set_key: ifindex=131 (wlan0) alg=3
addr=0x23490f0 key_idx=0 set_tx=1 seq_len=6 key_len=16
1428534380.576657: nl80211: KEY_DATA - hexdump(len=16): 99 76 89 40 b3
61 28 4f 60 2c 4b 75 72 6b 4e e8
1428534380.576668: nl80211: KEY_SEQ - hexdump(len=6): 00 00 00 00 00 00
1428534380.576677:    addr=00:0e:8e:3e:8b:96
1428534380.577056: nl80211: Set STA flags - ifname=wlan0
addr=00:0e:8e:3e:8b:96 total_flags=0x1 flags_or=0x1 flags_and=0xffffffff
authorized=1
1428534380.577108: AUTH: 00:0e:8e:3e:8b:96 authorizing port


However, there are other problems in your log:

1) There are two NL80211_CMD_JOIN_IBSS events from the kernel, for only
one join request.

2) wpa_supplicant sent a authentication frame at 1428534380.167582 and
never got any tx_status response from the kernel.  This was before the
second NL80211_CMD_JOIN_IBSS event.

Loosing a authentication frame is normally no big deal. It often
happens. They are even stations that do not support them.  If i remember
the logic that i implemented in wpa_supplicant, you consider the other
station as authenticated if you receive an authentication response or an
authentication request, or after a timeout.

3) But this timeout seems buggy: after completing the EAPOL exchange,
this timer fires:

1428534381.168652: RSN: Timeout on waiting Authentication frame response
from 00:0e:8e:3e:8b:96 - start authenticator

This timer shouldn't even be present. And even if it did, it shouldn't
start the authenticator as it is already started.  I didn't track the
latest changes in wpa_supplicant's IBSS-RSN support, but this seems wrong.

But it restart the authenticator anyway, which clears the PTK:

1428534381.168693: AUTH: auth_set_key(alg=0 addr=00:0e:8e:3e:8b:96
key_idx=0)
1428534381.168703: AUTH: set_key - key - hexdump(len=0): [NULL]
1428534381.168737: wpa_driver_nl80211_set_key: ifindex=131 (wlan0) alg=0
addr=0x2344bb0 key_idx=0 set_tx=1 seq_len=6 key_len=0
1428534381.168751: nl80211: KEY_SEQ - hexdump(len=6): 00 00 00 00 00 00
1428534381.168761:    addr=00:0e:8e:3e:8b:96

And mark the station as unauthorized:

1428534381.169266: nl80211: Set STA flags - ifname=wlan0
addr=00:0e:8e:3e:8b:96 total_flags=0x0 flags_or=0x0 flags_and=0xfffffffe
authorized=0
1428534381.169347: AUTH: 00:0e:8e:3e:8b:96 unauthorizing port

After that, it retries an EAPOL exchange which basically fail: the
remote station still have an encrypted session, and the logic in
wpa_supplicant is that you can only reset a encryption session by
sending an authentication frame.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
