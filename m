Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-sg2apc01on0044.outbound.protection.outlook.com
 ([104.47.125.44] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDtW2-0006K1-Pj
 for ath10k@lists.infradead.org; Tue, 29 Dec 2015 12:36:41 +0000
From: Sunder Kumaresan <sunder.kumaresan@aricent.com>
Subject: RE: Queries about ath10k driver and QCA988x based radio from sparklan
Date: Tue, 29 Dec 2015 12:36:13 +0000
Message-ID: <SG2PR04MB112077816A07D59CFB4A47FB9FFC0@SG2PR04MB1120.apcprd04.prod.outlook.com>
References: <BAY172-W453D76B23F2ACA5732B8EBE0F80@phx.gbl>
 <568132AD.2090608@sibridgetech.com> <56821F6E.5020102@sibridgetech.com>
In-Reply-To: <56821F6E.5020102@sibridgetech.com>
Content-Language: en-US
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
To: Ankur Saxena <ankur.saxena@sibridgetech.com>, sunder <sunder_k@hotmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Use iw phy phy0 info.

Max throughput info were published with control environment results.

Best Regards,
,k.sunder

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Ankur Saxena
Sent: Tuesday, December 29, 2015 11:22 AM
To: sunder <sunder_k@hotmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Queries about ath10k driver and QCA988x based radio from sparklan

Hi Sunder,

As in iwconfig we can use command "iwconfig wlan0" and can check the protocol used as 802.11 abgn. We have tried to use iw utility but there seems to be no command which gives information about the protocol getting used in radio. We have checked iw list command which shows which channels are supporting which frequency and other info. Also we tried "iw dev wlan0 info" command which shows the MAC id, type and channel information. Please help us in finding out whether our radio is configured in 802.11AC mode or not.

We have experimented more into this by making our radio as AP using hostapd as mentioned in previous mail. Here we found out that mobile devices supporting 802.11AC are the only devices which are able to see our SSID. So now we applied static IP to AP and devices supporting 802.11AC and tried to check different things in there as mentioned below:

1)*Link speed:*  with 3x3 MIMO 802.11AC radio card, I can see link speed of 780MBps on nexus 6p phone and 450MBps on htc one mobile device.
2)*Interface information:*
*a) 802.11ac dev info:*
root@Linux->    iw dev wlan0 info

Interface wlan0
        ifindex 5
        wdev 0x1
        addr 00:0e:8e:57:70:63
        ssid ath10k
        type AP
        wiphy 0
        channel 52 (5260 MHz), width: 80 MHz, center1: 5290 MHz

So here channel is working on 80MHz i.e. it is reflected VHT capability is set to 80 in hostapd configuration.

*b) 802.11n dev info:*
root@Linux-> iw wlan0 info
Interface wlan0
        ifindex 5
        wdev 0x1
        addr 00:0e:8e:57:70:63
        ssid ath10k
        type AP
        wiphy 0
        channel 157 (5785 MHz), width: 40 MHz, center1: 5795 MHz

So here channel is working on 40MHz i.e. it is reflected HT capability is set to 40 in hostapd configuration.


3)*Bandwidth calculation using iperf: TCP tx
a) 802.11AC: AP(3x3) (Client) -----> Nexus 6p(2x2) device (Server)
*
root@Linux-> iperf -c 10.10.0.4 -V -t 60
------------------------------------------------------------
Client connecting to 10.10.0.4, TCP port 5001
TCP window size: 43.8 KByte (default)
------------------------------------------------------------
[  3] local 10.10.0.1 port 54458 connected with 10.10.0.4 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-60.0 sec  1.23 GBytes*  176 Mbits/sec*

*b) 8**02.11AC: AP(3x3) (Client) -----> HTC ONE M7(1x1) device (Server)*
Same experiment was done with HTC one mobile device also and in that we
got bandwidth of*140Mbits/sec*.

*c)*  *802.11n: AP(3x3) (Client) -----> Nexus 6p(2x2) device (Server)*

root@Linux-> iperf -c 10.10.0.4 -t 60
------------------------------------------------------------
Client connecting to 10.10.0.4, TCP port 5001
TCP window size: 43.8 KByte (default)
------------------------------------------------------------
[  3] local 10.10.0.1 port 54462 connected with 10.10.0.4 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-60.0 sec   759 MBytes*106 Mbits/sec*


5) Should we consider that our radio is configured in 802.11AC mode?
Are these experiments going in right direction or can we verify the same
using some other method also?
Are we getting correct throughput with these experiments as we have
found some links where throughput has reached upto 250MBits/sec.

Thanks,
Ankur Saxena


On Monday 28 December 2015 06:31 PM, Ankur Saxena wrote:
> On Friday 25 December 2015 11:09 PM, sunder wrote:
>> Use iw tool.
>>
>>
>>
>> Best Regards,
>>
>> Sunder
>>
>>
>>
>> From: Ankur Saxena <ankur.saxena@sibridgetech.com>
>> Sent: Friday, December 25, 2015 5:49 PM
>> To: Sunder Kumaresan
>> Cc: ath10k@lists.infradead.org
>> Subject: Re: Queries about ath10k driver and QCA988x based radio from
>> sparklan
>>
>>
>>
>> Hi Sunder,
>>
>>
>>
>> We have upgraded kernel to 4.4.0 version. Also updated firmware from
>> git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>> for QCA988X. We are able to get up wlan0 in master mode and also able
>> to see it on our client mobiles which supports 802.11ac with link
>> speed 450Mbps. However iwconfig utility is not showind interface
>> protocol as 802.11ac.
>>
>>
>>
>>
>> Does any one know whether iwconfig supports 802.11ac protocol
>> information display as it looks like our radio is working as 802.11ac
>> only?
>>
>>
>>
>>
>> Thanks,
>>
>> Ankur Saxena
>>
>>
>>
>>
>>
>>
>> On Fri, Dec 25, 2015 at 5:40 PM, Sunder Kumaresan <
>> sunder.kumaresan@aricent.com> wrote:
>>
>> Did you update your firmware ?
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware
>>
>>   It worked for us in 3.18 Kernel
>>
>>   Use the above link.
>>
>>   Best Regards,
>>   Sunder
>>
>>
>>   ________________________________________
>>   From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of
>> Ankur Saxena <ankur.saxena@sibridgetech.com>
>>   Sent: Friday, December 25, 2015 4:44 PM
>>   To: ath10k@lists.infradead.org
>>   Subject: Queries about ath10k driver and QCA988x based radio from
>> sparklan
>>
>>
>>
>>   Hi All,
>>
>> We have purchased radio module "WPEA-352ACN" from SparkLan. We are using
>>   this radio module with ViaTech board for 802.11 AC functionality.
>> We are
>>   running linux kernel 3.19.1 with atheros driver ath10k up with all the
>>   configuration elements.
>>
>>   We are facing some issues in getting up 802.11 AC functionality for
>> the
>>   radio. Please find below the queries:
>>
>>   1) We are using latest ath10k driver with 802.11AC configuration
>>   enabled. On loading the driver for ath10k, we are not seeing
>> "802.11AC"
>>   in iwconfig utility for wlan interface. It is showing only 802.11 abgn
>>   for the interface.
>>
>>   2) Tried to make AP using the interface by taking help of hostapd
>>   utility. Searched on internet for configuration related to making
>> 802.11
>>   AC AP and used them all. In this case, Mode parameter in iwconfig is
>>   changed to Master which shows AP functionality, but the interface is
>>   still showing 802.11 abgn supported only.
>>
>>   3) We are using plain text version of regulatory database file
>> (DB.txt)
>>   which is maintained for use of CRDA. We are making sure that DB.txt
>> file
>>   is parsed properly and the database is added into MAC driver by
>> parsing
>>   the database file.
>>
>>   4) While running hostapd with full configuration for 802.11AC AP
>>   settings, no error is seen for setting up the interface. Channel
>> setting
>>   is done for Auto-configuration and VHT settings are also applied in
>> the
>>   configuration file. The interface is not able to get up in 802.11 AC
>>   mode, instead it is coming up only in 802.11 abgn only.
>>
>>   5) There is one error seen after firmware gets downloaded and starts
>>   running. The error is as below:
>>   ath10k_pci 0000:02:00.0: Direct firmware load for
>>   ath10k/cal-pci-0000:02:00.0.bin failed with error -2
>>   Can this may create this issue to happen also?
>>
>>   Please find attached the DB.txt and hostapd configuration file for
>>   reference.
>>
>>   Can anyone please help us in getting 802.11 AC mode up and running in
>>   the radio.
>>
>>
>> "DISCLAIMER: This message is proprietary to Aricent and is intended
>> solely for the use of the individual to whom it is addressed. It may
>> contain privileged or confidential information and should not be
>> circulated or used for any purpose other than for what it is
>> intended. If you have received this message in error, please notify
>> the originator immediately. If you are not the intended recipient,
>> you are notified that you are strictly prohibited from using,
>> copying, altering, or disclosing the contents of this message.
>> Aricent accepts no responsibility for loss or damage arising from the
>> use of the information transmitted by this email including damage
>> from virus."
>>
>>
>>
>>
>>
> Hi Sunder,
>
> As in iwconfig we can use command "iwconfig wlan0" and can check the
> protocol used as 802.11 abgn. We have tried to use iw utility but
> there seems to be no command which gives information about the protocol
> getting used in radio. We have checked iw list command which shows
> which channels are supporting which frequency and other info. Also we
> tried "iw dev wlan0 info" command which shows the MAC id, type and
> channel
> information. Please help us in finding out whether our radio is
> configured in 802.11AC mode or not.
>
> We have experimented more into this by making our radio as AP using
> hostapd as mentioned in previous mail. Here we found out that mobile
> devices supporting 802.11AC are the only devices which are able to see
> our
> SSID. So now we applied static IP to AP and devices supporting
> 802.11AC and tried to check different things in there as mentioned below:
>
> 1)*Link speed:*  with 3x3 MIMO 802.11AC radio card, I can see link
> speed of 780MBps on nexus 6p phone and 450MBps on htc one mobile device.
> 2)*Interface information:*
> *a) 802.11ac dev info:*
> root@Linux->    iw dev wlan0 info
>
> Interface wlan0
>        ifindex 5
>        wdev 0x1
>        addr 00:0e:8e:57:70:63
>        ssid ath10k
>        type AP
>        wiphy 0
>        channel 52 (5260 MHz), width: 80 MHz, center1: 5290 MHz
>
> So here channel is working on 80MHz i.e. it is reflected VHT
> capability is set to 80 in hostapd configuration.
>
> *b) 802.11n dev info:*
> root@Linux-> iw wlan0 info
> Interface wlan0
>        ifindex 5
>        wdev 0x1
>        addr 00:0e:8e:57:70:63
>        ssid ath10k
>        type AP
>        wiphy 0
>        channel 157 (5785 MHz), width: 40 MHz, center1: 5795 MHz
>
> So here channel is working on 40MHz i.e. it is reflected HT capability
> is set to 40 in hostapd configuration.
>
>
> 3)*Bandwidth calculation using iperf: TCP tx
> a) 802.11AC: AP(3x3) (Client) -----> Nexus 6p(2x2) device (Server)
> *
> root@Linux-> iperf -c 10.10.0.4 -V -t 60
> ------------------------------------------------------------
> Client connecting to 10.10.0.4, TCP port 5001
> TCP window size: 43.8 KByte (default)
> ------------------------------------------------------------
> [  3] local 10.10.0.1 port 54458 connected with 10.10.0.4 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  3]  0.0-60.0 sec  1.23 GBytes*  176 Mbits/sec*
>
> *b) 8**02.11AC: AP(3x3) (Client) -----> HTC ONE M7(1x1) device (Server)*
> Same experiment was done with HTC one mobile device also and in that
> we got bandwidth of*140Mbits/sec*.
>
> *c)*  *802.11n: AP(3x3) (Client) -----> Nexus 6p(2x2) device (Server)*
>
> root@Linux-> iperf -c 10.10.0.4 -t 60
> ------------------------------------------------------------
> Client connecting to 10.10.0.4, TCP port 5001
> TCP window size: 43.8 KByte (default)
> ------------------------------------------------------------
> [  3] local 10.10.0.1 port 54462 connected with 10.10.0.4 port 5001
> [ ID] Interval       Transfer     Bandwidth
> [  3]  0.0-60.0 sec   759 MBytes*106 Mbits/sec*
>
>
> 5) Should we consider that our radio is configured in 802.11AC mode?
> Are these experiments going in right direction or can we verify the
> same using some other method also?
> Are we getting correct throughput with these experiments as we have
> found some links where throughput has reached upto 250MBits/sec.
>
> Thanks,
> Ankur Saxena
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
"DISCLAIMER: This message is proprietary to Aricent and is intended solely for the use of the individual to whom it is addressed. It may contain privileged or confidential information and should not be circulated or used for any purpose other than for what it is intended. If you have received this message in error, please notify the originator immediately. If you are not the intended recipient, you are notified that you are strictly prohibited from using, copying, altering, or disclosing the contents of this message. Aricent accepts no responsibility for loss or damage arising from the use of the information transmitted by this email including damage from virus."

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
