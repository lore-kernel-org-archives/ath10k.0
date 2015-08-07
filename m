Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNo1o-0001Gi-FM
 for ath10k@lists.infradead.org; Fri, 07 Aug 2015 20:14:09 +0000
Received: by igfj19 with SMTP id j19so18920060igf.1
 for <ath10k@lists.infradead.org>; Fri, 07 Aug 2015 13:13:46 -0700 (PDT)
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com.
 [209.85.213.178])
 by smtp.gmail.com with ESMTPSA id 15sm7569100iop.3.2015.08.07.13.13.44
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Aug 2015 13:13:45 -0700 (PDT)
Received: by igbpg9 with SMTP id pg9so38486379igb.0
 for <ath10k@lists.infradead.org>; Fri, 07 Aug 2015 13:13:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=qDCehXx=56Q=UosgHATRBFdNygud8m-R0zz99QrCZOyA@mail.gmail.com>
References: <CALCDuF=3pR96tAD=ZZ_i1Nh88bMXdvU26sVD8i6OuKcgR3ctBQ@mail.gmail.com>
 <CALhHN=qDCehXx=56Q=UosgHATRBFdNygud8m-R0zz99QrCZOyA@mail.gmail.com>
Date: Fri, 7 Aug 2015 13:13:44 -0700
Message-ID: <CALCDuFmwPTT=GH1F6x-WnGHWgJ0BGNJPa8ULWYBUYrHE-aW2Vw@mail.gmail.com>
Subject: Re: Simultaneous hostapd and wpa_supplicant on QCA9880
From: Ann Lo <annlo@ieee.org>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks Janusz and Ben!

I have tried out firmware-2 version 999.999.0.636. The results are:
- Both wpa_supplicant and hostapd come up OK (using channel 6).
- It is also OK to use WPA2 on both, pinging with a remote client,
  and pinging with a remote AP at the same time.
- No kernel upgrades are needed to achieve the above.

I will provide further results when I try out CT kernel changes and
firmware.

Thanks,
Ann

On Wed, Aug 5, 2015 at 9:45 PM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> On 5 August 2015 at 19:08, Ann Lo <annlo@ieee.org> wrote:
>> Hello,
>>
>> Has anyone succeeded in running hostapd and wpa_supplicant at the same
>> time on a single QCA9880? I have not been able to. Does anyone have any
>> luck with this?
>>
>> The software/firmware I use:
>>
>> - Linux kernel 3.16.0-34-generic
> I think you should update your kernel - best compile code from gitub
> https://github.com/kvalo/ath
> Next you will get fresh cfg80211/mac80211/ath10k.
>
>> - firmware-2 version 10.1.467.2-1
> Single Channel Concurrency works correctly with 636 firmware - QCA9880
> - 10x fail in your case because of different iface combination.
> So, before kernel upgrade try 636 firmware.
>
> BTW:
> QCA6174 support also MCC.
>
>> - wpa_supplicant version 2.1
>> - hostapd version 2.4
>>
>> Configuration:
>>
>> - iw dev wlan4 interface add clientwlan type managed
>> - iw dev wlan4 interface add apwlan type __ap
>> - ip link set clientwlan address 04:f0:21:16:04:b0
>> - ip link set apwlan address 04:f0:21:16:04:b1
>> - ifconfig clientwlan up
>> - ifconfig apwlan up 10.0.0.1 netmask 255.255.255.0
>> - wpa_supplicant -iclientwlan -Dnl80211 -c wpa.test.conf
>> - hostapd -d hostapd-test.conf
>> - Both wpa_supplicant and hostapd use the same channel.
>>
>> Problems:
>>
>> (1) If wpa_supplicant is executed before hostapd, wpa_supplicant comes
>>      up OK but hostapd fails with the following errors:
>>      - nl80211: Beacon set failed: -16 (Device or resource busy)
>>      - Failed to set beacon parameters
>>
>> (2) If hostapd is executed before wpa_supplicant, hostapd comes up OK
>>      but wpa_supplicant fails with the following errors:
>>      - nl80211: send_and_recv->nl_recvmsgs failed: -33
>>      - clientwlan: SME: Trying to authenticate with 00:03:07:12:34:56
>> (SSID='dd-wrt-ath1' freq=5220 MHz)
>>      - clientwlan: SME: Authentication request to the driver failed
>>
>> Using the same configuration files, wpa_supplicant is able to connect
>> to the remote AP if hostapd is not executed. Similarly, hostapd is able
>> to provide service to the remote client if wpa_supplicant is not executed.
>> I have also tried configurations without any security. Same errors as
>> above when running hostapd and wpa_supplicant at the same time.
>>
>> I have exhausted all information I could find from the web. According
>> to this link (http://www.candelatech.com/vsta.php), there is the
>> suggestion that HW encryption cannot work with multiple virtual
>> interfaces. In one of my tests, I have disabled security altogether by
>> using "key_mgmt=NONE" in the configuration file for wpa_supplicant.
>> It is not clear why there continues to be an error "Authentication
>> request to the driver failed".
>>
>> Would you provide your expert opinions on this matter if you have the
>> experience?
>>
>> Thanks,
>> Ann
>>
>
> BR
> Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
