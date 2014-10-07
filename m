Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbXsu-0007XR-7H
 for ath10k@lists.infradead.org; Tue, 07 Oct 2014 16:45:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: calibration data through Device Tree?
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net>
 <CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com>
 <CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com>
Date: Tue, 7 Oct 2014 19:44:43 +0300
In-Reply-To: <CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com>
 (Andy Lutomirski's message of "Thu, 2 Oct 2014 12:35:09 -0700")
Message-ID: <87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Andy Lutomirski <luto@amacapital.net> writes:

> Perhaps unsurprisingly, the OpenWRT patch that enables it to work for
> real (by shoving a file into /lib/firmware that's contains a copy of
> data read from flash) hasn't made it upstream.  I assume that the
> purpose of this discussion is to settle on a real solution.

I'm hoping to have ath10k support three different methods to get
calibration data:

1) OTP (already supported)

2) Device Tree (under discussion)

3) from a file

I'm hoping to send patches for 2) and 3) soon.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
