Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z32SM-0008WQ-U2
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 13:23:43 +0000
Message-ID: <55798BC5.3030800@candelatech.com>
Date: Thu, 11 Jun 2015 06:23:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone tried ath10k AP with 40Mhz operation?
References: <55789EBF.2060501@candelatech.com>
 <CA+BoTQmWmrkCjTkq9R9qXZBqq=ynNKdsgn4uLNAucetXy39GRQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmWmrkCjTkq9R9qXZBqq=ynNKdsgn4uLNAucetXy39GRQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>



On 06/10/2015 11:54 PM, Michal Kazior wrote:
> On 10 June 2015 at 22:31, Ben Greear <greearb@candelatech.com> wrote:
>> I'm trying this hostapd config file.  Beacons seem OK, and station
>> associates.  Station puts DHCP Discover on the air (using 20Mhz according
>> to wireshark).  AP reads this, and thinks it is sending a DHCP response back,
>> but sniffer never shows DHCP response on the air.
>
> Is the MSDU carrying DHCP resp completed with "ok" status? Or is it
> maybe no-ack or discarded?

I'll check, and also try stock firmware to see if that makes a difference.

>> Kernel is 4.0.4+, ath10k firmware is CT firmware, 10.1.467 based.
>>
>> I am curious if anyone else has tried to do this?
>>
>> Thanks,
>> Ben
>>
>> interface=vap50
>> driver=nl80211
>> logger_syslog=-1
>> logger_syslog_level=2
>> logger_stdout=-1
>> logger_stdout_level=2
>> ctrl_interface=/var/run/hostapd
>> ctrl_interface_group=0
>> ssid=ben-ota-2a
> [...]
>
> Works for me on c7b39fdeb479a7956a3c41638d527196ce295fdd
> (github.com/kvalo/ath) with
>   AP: qca988x hw2.0, 10.1.467.2-1
>   STA: qca6174 hw2.2 (its a 2x2),

What NIC model is your qca6174?  In case I cannot
get my setup to work, it would be nice to be able to be able to duplicate
your configuration...


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
