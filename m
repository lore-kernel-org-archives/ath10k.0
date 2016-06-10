Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBM0V-0007Wv-KU
 for ath10k@lists.infradead.org; Fri, 10 Jun 2016 12:57:52 +0000
Subject: Re: ath10k/QCA9980 - Issues introduced in wireless testing 2016-05
References: <ff65514a-47a3-2f32-658c-a2177401aa9a@bk.ru>
 <CA+BoTQmJ+JruxZ9WsG8Dnz=cwNY+e3Dy=g74-brS+0OE_5iu0Q@mail.gmail.com>
 <d836933e-ddbb-d10c-0715-6bce4396fd41@nbd.name>
 <877fdxfd2l.fsf@kamboji.qca.qualcomm.com> <575AB829.10101@candelatech.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <f80db123-9b8a-289d-aed8-12531db13424@nbd.name>
Date: Fri, 10 Jun 2016 14:57:27 +0200
MIME-Version: 1.0
In-Reply-To: <575AB829.10101@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org, "A. Benz" <ash.benz@bk.ru>

On 2016-06-10 14:52, Ben Greear wrote:
> This looks a lot like the problems I was having.
> 
> Two of these 5 patches recently made it upstream (but may not be in LEDE yet),
> but the other patches also were related to memory corruption.
> 
> See my patches posted on 4/1/16:
> 
> https://patchwork.kernel.org/project/ath10k/list/
> 
> I don't know where the 5/5 patch ended up.
I had already asked affected users to test with those patches (I have a
commit that adds them in my staging tree), but it did not resolve the issue.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
