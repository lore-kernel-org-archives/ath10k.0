Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuOPO-0000Zj-Nb
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 15:56:23 +0000
Message-ID: <53972A91.1080600@candelatech.com>
Date: Tue, 10 Jun 2014 08:56:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org> <5396C39A.9080402@elisanet.fi>
 <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com> <5396C8EC.4090105@elisanet.fi>
 <87sindb0gj.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sindb0gj.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

On 06/10/2014 02:03 AM, Kalle Valo wrote:
> Matti Laakso <malaakso@elisanet.fi> writes:
> 
>>> But why let the user name provide the file name? Why cannot it be a
>>> fixed name, like "cal.bin"?
> 
> s/user name/user space/
> 
>> If there are multiple WNICs each with its own calibration data?
> 
> Ah, of course.


Another nice feature would be to allow configuring the number of
vdevs, peers, etc per NIC.  That way, you could have one NIC
tuned to be one big AP with lots of peers, and a second could
be several small APs with fewer peers and some stations, etc.

Maybe this could be a separate file, or maybe it would be worth
adding this to a TLV type file with cal.bin being part of the
data?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
