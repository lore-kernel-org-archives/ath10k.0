Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm35-vm5.bullet.mail.bf1.yahoo.com ([72.30.238.77])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyjfY-0004bf-2C
 for ath10k@lists.infradead.org; Tue, 17 Nov 2015 17:03:53 +0000
Date: Tue, 17 Nov 2015 17:02:58 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <403673121.6466400.1447779779000.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <564B5004.7070103@candelatech.com>
References: <564B5004.7070103@candelatech.com>
Subject: Re: TX-Power limits for ath10k based card on Linux 3.18.24 (long
 term support)?
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben,
thanks for taking the time to answer. I followed your suggestion and repeated my tests
with your beta-15 firmware.
The results are interesting. At first I thought nothing had changed. The txpower was about 10dB, 

far short of the expected 20dB. Playing around with "iw dev ap set txpower fixed ... " did not result in significiant changes.

However, when I add an attenuator between the powermeter and the antenna, the measured txpower markedly increased. With 10dB attenuation I get 12dB, with 20dB attenuation the txpower increases to more than 15dB.

Question: Is this the expected behaviour? Can I force a fixed txpower instead of this dynamic adaptation?

 -- Regards       Joerg



> Ben Greear <greearb@candelatech.com> schrieb am 17:04 Dienstag, 17.November 2015:
> > You might try CT firmware...I fixed some issues with tx-power for single chain 
> rates.
> 
> http://www.candelatech.com/ath10k.php
> 
> I suggest version 'beta-15', it is about to be officile release-15.
> 
> I'm curious to know the results if you do test with it.
> 
> Thanks,
> Ben
> 
> 
> 
> On 11/17/2015 02:19 AM, Joerg Pommnitz wrote:
>>  Hello all,
>>  I'm trying to use a COMPEX WLE600VX (see 
> http://www.compex.com.sg:809/Datasheets/WLE600VX_Dsv1.0.2-141013-I.pdf) as an 
> Access Point. According to the data sheet, the card should be able to transmit 
> with about 20 dB (100mW). However, doing some measurements with a card on 2.4GHz 
> channel 3 in 802.11g 54MBit coding I could only observe a TX power of about 
> 7..9dB. During the measurement the card was under full load with iperf 
> transmitting at 20..25 mbps. This is only a fraction of the stated TX power, so 
> something strange must be going on. The measurements were done with a Marconi 
> 6460 powermeter.
>> 
>> 
>>  My hostapd.conf is very simple:
>>  interface=ap
>>  driver=nl80211
>>  ssid2=<omitted>
>>  channel=3
>>  hw_mode=g
>>  auth_algs=1
>>  ignore_broadcast_ssid=0
>>  eap_server=0
>>  wpa=3
>>  wpa_passphrase=<omitted>
>>  wpa_key_mgmt=WPA-PSK WPA-PSK-SHA256
>>  wpa_pairwise=TKIP CCMP
>>  ctrl_interface=/var/run/hostapd
>>  macaddr_acl=0
>> 
>>  The regdb (compiled directly into the kernel) shouldn't be a problem 
> either:
>>  global
>>  country 00: DFS-UNSET
>>  (2402 - 2472 @ 40), (N/A, 100), (N/A)
>>  (2457 - 2482 @ 40), (N/A, 100), (N/A)
>>  (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
>>  (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>  (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, PASSIVE-SCAN
>>  (5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
>>  (5735 - 5835 @ 80), (N/A, 20), (N/A), PASSIVE-SCAN
>>  (57240 - 63720 @ 2160), (N/A, 0), (N/A)
>> 
>>  Does anybody have an idea, why the TX power seems to be so very low?
>> 
>> 
>>    -- Regards       Joerg
>> 
>>  _______________________________________________
>>  ath10k mailing list
>>  ath10k@lists.infradead.org
>>  http://lists.infradead.org/mailman/listinfo/ath10k
>> 
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
