Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brzoN-00029u-B0
 for ath10k@lists.infradead.org; Thu, 06 Oct 2016 03:57:36 +0000
Received: by mail-ua0-x235.google.com with SMTP id p25so6786515uaa.1
 for <ath10k@lists.infradead.org>; Wed, 05 Oct 2016 20:57:12 -0700 (PDT)
MIME-Version: 1.0
From: Vijay Kumar R Patel <vijay@lukup.com>
Date: Thu, 6 Oct 2016 09:27:11 +0530
Message-ID: <CANfwihOywsOteLXGa_zHMep-V+6axkUTGbMZjf--0u9ecavdCQ@mail.gmail.com>
Subject: Very low throughput on QCA9880 ath10k module
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

HI all,
we are testing throughput on our QCA9880 module using iperf command,
we are getting 10Mbps throughput, tried with all iperf options like
TCP window size,length but not getting more than 10Mbps.

Test procedure and system info
iperf b/w AP <----> STA
QCA9880 module on both ap and sta, with backported(backports-3.14-1)
ath10k driver running on Linux kernel version 2.6.32 with
firmware-2.bin_10.1.467.3-1

we are using hostapd configuration from
http://linuxwireless.org/en/users/Drivers/ath10k/configuration/ with
open system authentication

our system runs with dual core 800MHz network processor

iw dev wlan0 station dump
Station 04:f0:21:19:7a:c6 (on wlan0)
        inactive time:  209172 ms
        rx bytes:       1705693
        rx packets:     22992
        tx bytes:       67114841
        tx packets:     43826
        tx retries:     0
        tx failed:      0
        beacon loss:    0
        signal:         -56 dBm
        signal avg:     -63 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     468.0 MBit/s VHT-MCS 5 80MHz VHT-NSS 2
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    0
        beacon interval:240
        short slot time:yes
        connected time: 1973 seconds

Any input, thoughts on this issue
would be very helpful to us

Thanks and regards,
VIjay

-- 


*This message and any attachment are confidential and may be privileged or 
otherwise protected from disclosure and solely for the use of the person(s) 
or entity to whom it is intended. The contents is issued in confidence for 
the purpose only for which it is produced. **If you have received this 
message in error and are not the intended recipient, please notify the 
sender immediately and delete this message and any attachment from your 
system. If you are not the intended recipient, be advised that any use of 
this message is prohibited and may be unlawful, and you must not copy this 
message or attachment or disclose the contents to any other person.*


*Internet correspondence is not secure and neither Lukup Media Pvt. Ltd. 
nor the sender accepts responsibility for viruses or other forms of data 
corruption caused by such. It is your responsibility to scan this e-mail 
and any attachments for viruses. Neither Lukup Media Pvt. Ltd. nor the 
sender does accept liability for any errors or omissions in the contents of 
this message or attachments that arise as a result of e-mail transmission. *

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
