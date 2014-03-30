Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUCAg-0003sR-M6
 for ath10k@lists.infradead.org; Sun, 30 Mar 2014 09:36:55 +0000
Received: by mail-we0-f173.google.com with SMTP id w61so3631401wes.4
 for <ath10k@lists.infradead.org>; Sun, 30 Mar 2014 02:36:30 -0700 (PDT)
Message-ID: <5337E59C.3060706@intec.ugent.be>
Date: Sun, 30 Mar 2014 11:36:28 +0200
From: Bart Jooris <bart.jooris@gmail.com>
MIME-Version: 1.0
Subject: Re: Running throughput tests
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <008d01cef722$2a9c05e0$7fd411a0$@sparklan.com>
 <52A9DEF9.8080305@intec.ugent.be>
 <012e01cef7e0$99017e70$cb047b50$@sparklan.com>
 <52AACFB9.8080901@intec.ugent.be>
 <006301cefa3c$44c07b50$ce4171f0$@sparklan.com>
 <52AEC26B.2060400@intec.ugent.be>
 <007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>
 <52AEE61F.5030505@intec.ugent.be>
 <006b01cefacb$6c0b2d60$44218820$@sparklan.com>
 <52B00B10.3050300@intec.ugent.be>
 <004b01cefb9d$04a543e0$0defcba0$@sparklan.com>
 <52B2AE75.9050206@intec.ugent.be>
 <00df01cf0090$05944f10$10bced30$@sparklan.com>
 <52B9672E.9000701@intec.ugent.be>
 <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
 <530A64E5.2040401@intec.ugent.be> <530B0670.1010009@stackframe.org>
 <530E5EF2.8070800@intec.ugent.be>
 <87y50weecb.fsf_-_@kamboji.qca.qualcomm.com>
 <5335910B.3000702@intec.ugent.be> <87y4zutk4i.fsf@kamboji.qca.qualcomm.com>
 <53372210.7060903@intec.ugent.be>
In-Reply-To: <53372210.7060903@intec.ugent.be>
Reply-To: Bart.Jooris@intec.ugent.be
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

Dear Kalle,

On 03/29/2014 08:42 PM, Bart Jooris wrote:
> On 03/28/2014 04:31 PM, Kalle Valo wrote:
>
>>
>> * Are you sure that the host is not limiting the throughput in any way?
>>    Try to disable _all_ kernel debug options.
> /var/log/syslog and dmesg doesn't to be packed with messages related 
> to the throughput test. I don't think to have seen the CPU being 
> overloaded during the test.
> I'm planning to go back to the office tomorrow to verify this.
>

I just ran a new test to verify if the AP or the STA are under stress.
What you can see here is dstat, hostapd and iperf running on the AP.
After +-8 seconds I've started iperf on the STA.

bjooris@DSS-1300-2:~$ dstat -c -n -N wlan0 -d -D sda1
----total-cpu-usage---- -net/wlan0- --dsk/sda1-
usr sys idl wai hiq siq| recv  send| read  writ
   0   0 100   0   0   0|   0     0 | 228k 9002B
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|   0     0 |   0     0
   0   0 100   0   0   0|4710k    0 |   0     0
   0   0  99   0   0   0|  16M    0 |   0     0
   0   0  99   0   0   0|  17M    0 |   0     0
   0   1  99   0   0   0|  17M    0 |   0     0
   0   0  99   0   0   0|  17M    0 |   0     0
   0   0  99   0   0   0|  17M    0 |   0     0
   1   0  99   0   0   0|  17M   62B|   0     0
   0   1  99   0   0   0|  17M    0 |   0     0
   0   0  99   0   0   0|  16M    0 |   0     0
   0   0  99   0   0   0|  17M    0 |   0     0
   0   1  99   0   0   0|  17M    0 |   0     0
   0   0 100   0   0   0|  17M    0 |   0     0

Same info on the STA with iperf already running.

----total-cpu-usage---- -net/wlan0- --dsk/sda1-
usr sys idl wai hiq siq| recv  send| read  writ
   0   3  97   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    17M|   0     0
   0   2  98   0   0   0|   0    18M|   0     0
   1   4  95   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    18M|   0     0
   1   3  96   0   0   0|   0    17M|   0     0
   0   3  96   0   0   0|   0    18M|   0     0
   1   4  96   0   0   0|   0    18M|   0     0
   0   4  96   0   0   0|   0    17M|   0     0
   1   4  95   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    17M|   0     0
   0   3  97   0   0   0|   0    17M|   0     0

I will now try to build the latest ath10k.

Thanks a lot,

Bart


-- 
Bart Jooris
Department of Information Technology
Internet Based Communication Networks and Services (IBCN)
Ghent University - iMinds
Gaston Crommenlaan 8 (Bus 201), B-9050 Gent, Belgium
E-mail: bart.jooris@intec.UGent.be
M: +32 474 59 53 42
Tel. +32 9 33 14900
Fax +32 9 33 14899


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
