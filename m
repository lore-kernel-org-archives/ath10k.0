Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp2.ugent.be ([157.193.49.126])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7ReL-0002au-6e
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 16:01:46 +0000
Message-ID: <53C6A1C7.5060004@intec.ugent.be>
Date: Wed, 16 Jul 2014 18:01:11 +0200
From: Bart Jooris <Bart.Jooris@intec.ugent.be>
MIME-Version: 1.0
Subject: Re: Throughput is very low
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
In-Reply-To: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Bart.Jooris@intec.ugent.be
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Mamun Abu-Tair <ma86@st-andrews.ac.uk>, ath10k@lists.infradead.org

Dear Mamum,

On 07/09/2014 04:22 PM, Mamun Abu-Tair wrote:
> Dear all,
> I am trying to do throughput test with copmex AC cards Model (WLE900VX 7AA) .,using hostapd running on the server and  one client.
I have some cards with the same label. Hostapd on the server, on the 
station we use wpa_supplicant.
>
> I used Kalle sitting for the hostapd. However, the maximum throughput i can get is around 70Mbit/s which is far away from the throughput achieved by many users (UDP traffic).
In a setup with those cards we can observe a UDP throughput of approx. 
640Mbps.

>
> I have notice that Bit Rate keeps fixed 6 Mb/s . and it dose not responding to any commands to change it.
While running iperf client on the station I can also retrieve the Tx 
bitrate of 6Mbps with both iwconfig and 'iw wlanX station dump'. Version 
of iw has some impact on the output too, I have version 3.15.  I don't 
know a tool which shows the right info on the transmitting node...
But a third node which is configured as a sniffer shows Tx bitrate of 
1299.99Mbps :-)

>
> The machines used:
>   Ubuntu 12.04, Kerenl 3.16 , updated regulatory to cover 80Mhz channels , and the latest  firmware
Our nodes are also running 12.04 but still with the default kernel 
3.11.0-15-generic.
dmesg | grep qca98 shows
[    4.594975] ath10k: qca988x hw2.0 (0x4100016c) fw 10.1.467.2-1 api 2 
htt 2.1
Further, as Kalle suggested, we installed the ath10k driver from 
backports-3.15.1-1.

Best regards,

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
