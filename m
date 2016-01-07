Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHALt-0007xf-Te
 for ath10k@lists.infradead.org; Thu, 07 Jan 2016 13:11:42 +0000
Received: by mail-wm0-x22f.google.com with SMTP id u188so97751075wmu.1
 for <ath10k@lists.infradead.org>; Thu, 07 Jan 2016 05:11:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALQ-SODE8oxy83ES0i3EVzbSmCcSxjZDEZyCBKWogoX1hzX5ZQ@mail.gmail.com>
References: <CALQ-SODE8oxy83ES0i3EVzbSmCcSxjZDEZyCBKWogoX1hzX5ZQ@mail.gmail.com>
Date: Thu, 7 Jan 2016 14:11:14 +0100
Message-ID: <CALhHN=qBXBnRCokeJGpYtM6Hj+3_Taf70w+K9yJyf9csLSSavQ@mail.gmail.com>
Subject: Re: Nonstandard frequencies
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Steven Pease <spease@suitabletech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 January 2016 at 00:45, Steven Pease <spease@suitabletech.com> wrote:
> Hi,
> I've heard rumors that Atheros cards can be tuned to frequencies
> between 2.4 and 5GHz (assuming you follow due diligence with FCC
> regs).
>
HW/FW report something like this in hal_reg_capabilities:

2.4GHz     2312 - 2732
5GHz        4910 - 6100

So, I suspect such freqs could be used.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
