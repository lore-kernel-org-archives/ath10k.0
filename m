Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTWN-0004tw-PT
 for ath10k@lists.infradead.org; Tue, 10 Nov 2020 13:17:16 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id c18so11593696ybj.10
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2020 05:17:13 -0800 (PST)
MIME-Version: 1.0
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 10 Nov 2020 18:46:36 +0530
Message-ID: <CAMi1Hd0tHtTZ=BHeKNv5Nwt6PnUGVwg40BaRjDxNtAEKB_CQEw@mail.gmail.com>
Subject: ath10k regressions with "failed to extract amsdu: -11"
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
To: ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Guys,

I've been hitting "ath10k_snoc 18800000.wifi: failed to extract
amsdu: -11" a lot lately on PocoF1 (sdm845) and that or may
be followup errors make WiFi impossible to use.

Initially I thought it is a v5.10-rc regression but then I ran into
this 3 year old bug report
http://lists.infradead.org/pipermail/ath10k/2017-October/010227.html
and as it turned out, I'm running into this exact same problem.
That it happens only when PocoF1 is connected to my recently
bought WiFi router (TP Link, Archer C6 v2.0, Qualcomm Atheros
QCA9563 / QCA9886), otherwise WiFi just works fine.

I have been told that I'm not the only one running into this problem,
but I'm not able to find any solution on the web (though most
suggest that I should install openwrt on the router instead but that
is not happening:) Any other suggestions or known workarounds?

Regards,
Amit Pundir

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
