Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z20CL-0001so-2d
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 16:46:53 +0000
References: <5575BEB1.4010706@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5575C6E4.6050809@dd-wrt.com>
Date: Mon, 8 Jun 2015 18:46:28 +0200
MIME-Version: 1.0
In-Reply-To: <5575BEB1.4010706@candelatech.com>
Subject: Re: Does the reg_addr/reg_value reading work?
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
To: ath10k@lists.infradead.org

Am 08.06.2015 um 18:11 schrieb Ben Greear:
> I am not getting expected values when I try to read registers
> through the ath10k reg_addr/reg_value API.
>
> For instance, I tried reading a particular register 0x80e0
> (as defined in the firmware), and I get a zero value.  With a different
> API that I wrote to dump some specific registers over the WMI API,
> I get the expected value.
>
> # echo 0x80e0 > /debug/ieee80211/wiphy0/ath10k/reg_addr
> # cat /debug/ieee80211/wiphy0/ath10k/reg_value
> 0x000080e0:0x00000000
> # cat /debug/ieee80211/wiphy0/ath10k/fw_regs
>
>     ath10k Target Register Dump
>               =================
>
>             MAC-FILTER-ADDR-L32 0xd7ffffff
> ...
>
> Is there some trick I am missing?
0x20000 offset makes the voodoo. you will find this offset within your 
firmware source too. take a look at the preconfigured register tables. 
these contain already the ack,slot etc. settings.
but with a special macro surrounding it which defines that offset

echo 0x2080e0 > /debug/ieee80211/wiphy0/ath10k/reg_addr

>
> Thanks,
> Ben
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
