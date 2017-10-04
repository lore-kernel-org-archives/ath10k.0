Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzfO2-0002sq-JB
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 08:50:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA988x and kernel 4.13
Date: Wed, 4 Oct 2017 08:50:10 +0000
Message-ID: <87d163xpoe.fsf@kamboji.qca.qualcomm.com>
References: <c6294832-ff1e-595c-da8b-dac59b12a976@gmail.com>
 <7549b77b-3619-f8a5-48d6-eb7e330ba80e@dd-wrt.com>
 <48aebea8-9231-b41e-cbaa-d592d8540c53@candelatech.com>
In-Reply-To: <48aebea8-9231-b41e-cbaa-d592d8540c53@candelatech.com> (Ben
 Greear's message of "Mon, 2 Oct 2017 10:24:14 -0700")
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, svp <s.pooheer@gmail.com>

Ben Greear <greearb@candelatech.com> writes:

> On 10/01/2017 07:06 AM, Sebastian Gottschall wrote:
>> you have to update to the latest mac80211 code. there is a well
>> known bug in mac80211 which causes a deadlock with ath10k
>
> Do you have a pointer to the patch that fixes this?  I'd like to check if it has
> made it into 4.13 stable yet...

I think it's this one:

mac80211: fix deadlock in driver-managed RX BA session start

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bde59c475e0883e4c4294bcd9b9c7e08ae18c828

Adding linux-wireless so that someone can correct me in case I'm wrong.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
