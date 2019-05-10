Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP4db-00025I-Nk
 for ath10k@lists.infradead.org; Fri, 10 May 2019 12:28:32 +0000
Received: by mail-lj1-x243.google.com with SMTP id q10so4941656ljc.6
 for <ath10k@lists.infradead.org>; Fri, 10 May 2019 05:28:30 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id q15sm1434764lfh.59.2019.05.10.05.28.27
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 05:28:27 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j20so4029484lfh.2
 for <ath10k@lists.infradead.org>; Fri, 10 May 2019 05:28:27 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 May 2019 05:28:11 -0700
Message-ID: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
Subject: ath10k: wmi service ready event not received
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

Hmm.

I have a nice new laptop, and it works fine. Except today it lost
wireless, and I have no idea why.

It's not happened before (but it's fairly new and I'm actually on my
first trip with it), so I don't know how common this is, but the
kernel messages seem to say that the cause of it was

  ath10k_pci 0000:02:00.0: wmi service ready event not received
  ath10k_pci 0000:02:00.0: could not init core (-110)
  ath10k_pci 0000:02:00.0: could not probe fw (-110)

and then nothing works. -110 is ETIMEDOUT, fwiw.

Rebooting got wireless back. It's possible I could have done something
less drastic, but I was thinking that it would be the new kernel and
rebooted into an older version. But then rebooting into the new one
afterwards (double-checking before starting a bisect) and it all
worked.

Is there anything I can do to debug this if it happens again?

               Linus

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
