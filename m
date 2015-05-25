Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ywvx3-0006Pc-1t
 for ath10k@lists.infradead.org; Mon, 25 May 2015 17:14:13 +0000
Message-ID: <5563584A.80604@candelatech.com>
Date: Mon, 25 May 2015 10:13:46 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: request: ACK timing setting required
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
 <87oal83kv4.fsf@kamboji.qca.qualcomm.com> <5563577E.4020208@dd-wrt.com>
In-Reply-To: <5563577E.4020208@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org



On 05/25/2015 10:10 AM, Sebastian Gottschall wrote:
> Hello
>
> could it be possible to add a ACK timing feature to the ath10k firmware (QCA9880 internal register 0x8014, mask 0x3FFF)

You just need ability to set this register to some value?

If so, probably something I could add to CT firmware, at least.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
