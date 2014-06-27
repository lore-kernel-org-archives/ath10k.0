Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0YYz-0007fn-Ih
 for ath10k@lists.infradead.org; Fri, 27 Jun 2014 15:59:46 +0000
Message-ID: <53AD94DA.3010908@candelatech.com>
Date: Fri, 27 Jun 2014 08:59:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : Warning message in bridge mode
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
 <539F0393.1090009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F10997914@srvexch01.SODIELEC.local>
 <53A89D2E.6010708@candelatech.com>,
 <E37BEAE7-CCA9-4C79-9F24-051E867FC0F6@gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997915@srvexch01.SODIELEC.local>,
 <53A994F7.6090707@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7D5@srvexch01.SODIELEC.local>,
 <53AC2F78.7080307@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7D6@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F15C1D7D6@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bruno Antunes <baantunes@gmail.com>



On 06/27/2014 08:52 AM, Vu Hai NGUYEN wrote:
>> It would not be easy for me to do that.  While you found a single patch that
>> fixed the crash for you, I believe it is also dependent on many patches that
>> came before that one as well.
>
>> For your throughput tests, are you using UDP or TCP?  You might try TCP in
>> case you are hitting the same packet-reordering issue reported in another
>> email thread.
>
> But as you and Bruno Antunes said before the warning message is normal and I can ignore it?
> I've tested with both TCP and UDP using iperf. I'm testing TCP with option -w256K and 10 stream (-P10)
> With Open Authentication in 802.11ac VHT80
>    UDP Download (1% packet lost) :  565 Mbps
>    UDP Upload (1% packet lost):   320 Mbps
>    TCP Download:  380 Mbps
>    TCP Upload:    260 Mbps
>
>> At least for standard operation (ie, no software-crypt), I doubt my
>> changes to the firmware had any significant impact on performance
>> or throughput.
>
> You're right, If I do not enter promiscuous mode, I get the same rate when doing test with your firmware and the official firmware.
> But if I use your firmware for my STA in promiscuous mode, the rate is a little bit slower when doing test (about 20 Mbps less than non promiscuous mode)

Can you run 'perf top' or similar on your system to see if the kernel is doing more work
in promisc mode?  Promisc (monitor) mode is going to disable some firmware packet cooking,
so I think you may end up doing extra work in the driver.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
