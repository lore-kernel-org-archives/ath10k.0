Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYbU1-00055s-8T
 for ath10k@lists.infradead.org; Fri, 30 Oct 2020 20:58:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id w21so6347310pfc.7
 for <ath10k@lists.infradead.org>; Fri, 30 Oct 2020 13:58:47 -0700 (PDT)
From: Abhishek Kumar <kuabhs@chromium.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
Date: Fri, 30 Oct 2020 20:56:38 +0000
Message-Id: <20201030205639.1452712-1-kuabhs@chromium.org>
In-Reply-To: <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
References: <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
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
To: johannes@sipsolutions.net
Cc: kuabhs@chromium.org, cjhuang@codeaurora.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org

From: kuabhs@chromium.org

These patches do not apply cleanly on kernel 5.4. I fixed the merged conflicts
and verified. I verified these APIs using power_manager in chromeos, the APIs 
works fine.
Tested-by: Abhishek Kumar <kuabhs@chromium.org>

-Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
