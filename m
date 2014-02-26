Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIXuO-0002hu-LA
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 06:23:57 +0000
Received: by mail-wg0-f47.google.com with SMTP id n12so1286473wgh.30
 for <ath10k@lists.infradead.org>; Tue, 25 Feb 2014 22:23:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
References: <530D128B.3030509@candelatech.com>
 <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
Date: Wed, 26 Feb 2014 07:23:27 +0100
Message-ID: <CACKGw+GQjCgDFPzXC09vVFuF6xvrkkO84pJ3BAzvfsz0a3K1VQ@mail.gmail.com>
Subject: Re: Anyone have a working hostapd conf file for AC?
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On 26 February 2014 01:19, Avery Pennarun <apenwarr@gmail.com> wrote:
> On Tue, Feb 25, 2014 at 2:00 PM, Ben Greear <greearb@candelatech.com> wrote:
>> Does anyone have a working hostapd config file for
>> ath10k?
>
> Here's mine (20/40/80 MHz all supported):
>
> interface=wlan0
> bridge=br0
> ssid=TestWifi
> auth_algs=1
> wpa=2
> wpa_passphrase=1234567890
> wpa_key_mgmt=WPA-PSK
> wpa_pairwise=CCMP
> hw_mode=a
> channel=36
> country_code=US
> ieee80211d=1
> ieee80211h=1
> ieee80211n=1
> ieee80211ac=1
> ht_capab=[HT40+]
> vht_oper_chwidth=1
> # Wifi channel numbers define the center of a 20 MHz
> # channel.  40 MHz channels are defined as one channel plus
> # the next one 4 up.  80 MHz channels go back to defining by
> # center.  If you think about it long enough, you eventually
> # discover that the center is 6 channels up from the base 20
> # MHz channel, although this isn't very intuitive.
> vht_oper_centr_freq_seg0_idx=42

I would suggest to expand the vht capabs in the hostapd config, at least like:
vht_capab=[MAX-MPDU-11454][SHORT-GI-80][MAX-A-MPDU-LEN-EXP0]

MAX-A-MPDU-LEN-EXP0 is translated in hostapd to
VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT
(I think it should be EXP7 actually there, I was going to send a patch
some time ago for this)

Without this I also got no more than ~200Mbps in ath10k-AP RX.

-Bartosz

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
