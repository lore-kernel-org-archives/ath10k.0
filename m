Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqjRq-0004Zd-WA
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 15:12:35 +0000
Message-ID: <562E42CB.4090809@candelatech.com>
Date: Mon, 26 Oct 2015 08:12:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Specific MAC address impact performance
References: <CAGJdtRAxPKvNZAZK=YMTGd0mJKP=e2gatyofPz-1KpPj_kU5Rw@mail.gmail.com>
In-Reply-To: <CAGJdtRAxPKvNZAZK=YMTGd0mJKP=e2gatyofPz-1KpPj_kU5Rw@mail.gmail.com>
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
To: Yu-Chieh <jay0607@gmail.com>, ath10k@lists.infradead.org

Your probably have BSSID mask collision.  Rule of thumb is to leave
all octets the same except the second and third (from the right)
byte.  That usually gives you unique masks assuming the right-most
byte is unique for your radios.

Thanks,
Ben


On 10/26/2015 03:50 AM, Yu-Chieh wrote:
> Hi,
>
> I am working on IBSS mode by using ath10k. However i met some problem
> about the performance issue
> First of all, i set up two nodes, A (74:DA:38:19:19:DC) and B
> (74:DA:38:06:E1:96) and run iperf.
> i can get around 170 Mbps form A to B
>
> Then, i turn on the third node C(74:DA:38:06:E1:BE).
> The performance is deteriorated to around 30Mbps.
> If i turn off node C, the performance go back to 170 Mbps.
>
> At the same environment and same devices, i jsut change the mac of B
> to (74:DA:38:06:E1:B2)
> Everything is good.
> No matter node c is on or off, the performance always keep on 170Mbps.
>
> Anyone have any idea about this problem?
>
> Jay
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
