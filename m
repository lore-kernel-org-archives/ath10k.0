Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.bemta7.messagelabs.com ([216.82.254.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwYLe-0008Rg-8r
 for ath10k@lists.infradead.org; Thu, 04 Dec 2014 15:29:43 +0000
From: Sven Eckelmann <sven@open-mesh.com>
Subject: Re: IBSS mode is now supported by CT firmware.
Date: Thu, 4 Dec 2014 16:28:55 +0100
Message-ID: <78773989.kHFoMHjKGm@bentobox>
In-Reply-To: <547CAC1E.2000709@candelatech.com>
References: <547525D4.5080701@candelatech.com>
 <CAD1M060=TLNR-ZFdTiwq8tAbC=2h2zsKbxyFkkL1N5pvfwLWEA@mail.gmail.com>
 <547CAC1E.2000709@candelatech.com>
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
To: ath10k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, Pushpal Sidhu <psidhu@gateworks.com>

On Monday 01 December 2014 09:57:50 Ben Greear wrote:
> If you have time, can you see if you can get encryption working with
> ath9k to ath9k?  I could not get that working, and I am not sure if
> it is my supplicant setup or if I have some other bugs somewhere...
> 
> Please post config files if you do get it working.

My wpa_supplicant config:

ap_scan=2
network={
	mode=1
	scan_ssid=0
	ssid="mesh"
	bssid=02:BA:DE:AF:FE:01
	key_mgmt=WPA-PSK
	proto=RSN
	frequency=2462
	fixed_freq=1
	beacon_int=100
	mcast_rate=18
	ibss_ht_mode=HT20
	psk="89b8e7e66900dd31b4d1fefa60ed3efb"
}

You need at least the wpa_supplicant version from 
http://w1.fi/cgit/hostap/commit/?id=13adc57b39091dc59372efbeb614b74310dd2e02


> And, what is ath9k to ath9k transfer rates?

I don't have numbers here which I am allowed to post but it is only slightly 
(really tiny difference when measurable at all) slower than the AP<->Sta 
setup.

But you also need an wpa_supplicant patch to enable HT-rates (together with 
wpa_supplicant).

http://lists.shmoo.com/pipermail/hostap/2012-November/026934.html

Btw. I haven't tested your fw and thus cannot say if anything written above 
would also work with ath10k.

Kind regards,
	Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
