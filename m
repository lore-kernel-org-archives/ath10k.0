Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WISEG-0004XI-HP
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 00:20:05 +0000
Received: by mail-vc0-f175.google.com with SMTP id ij19so174539vcb.6
 for <ath10k@lists.infradead.org>; Tue, 25 Feb 2014 16:19:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <530D128B.3030509@candelatech.com>
References: <530D128B.3030509@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 25 Feb 2014 16:19:21 -0800
Message-ID: <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
Subject: Re: Anyone have a working hostapd conf file for AC?
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Feb 25, 2014 at 2:00 PM, Ben Greear <greearb@candelatech.com> wrote:
> Does anyone have a working hostapd config file for
> ath10k?

Here's mine (20/40/80 MHz all supported):

interface=wlan0
bridge=br0
ssid=TestWifi
auth_algs=1
wpa=2
wpa_passphrase=1234567890
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
hw_mode=a
channel=36
country_code=US
ieee80211d=1
ieee80211h=1
ieee80211n=1
ieee80211ac=1
ht_capab=[HT40+]
vht_oper_chwidth=1
# Wifi channel numbers define the center of a 20 MHz
# channel.  40 MHz channels are defined as one channel plus
# the next one 4 up.  80 MHz channels go back to defining by
# center.  If you think about it long enough, you eventually
# discover that the center is 6 channels up from the base 20
# MHz channel, although this isn't very intuitive.
vht_oper_centr_freq_seg0_idx=42

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
