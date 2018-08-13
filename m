Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2001:470:dc45:1000::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpAre-0003At-WD
 for ath10k@lists.infradead.org; Mon, 13 Aug 2018 11:18:24 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: RE: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
In-Reply-To: <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
Date: Mon, 13 Aug 2018 13:18:04 +0200
Message-ID: <87600eecr7.fsf@toke.dk>
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
To: Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Wen Gong <wgong@qti.qualcomm.com> writes:

> Hi Toke,
>
> I have tested with your method for shift 6/8/10/7 all twice time in
> open air environment.

Great, thanks!

> Shift 6:
> wgong@wgong-Latitude-E5440-1:~/flent$ flent -H 192.168.1.7 -t
> "sk_pacing_shift6" tcp_nup --test-parameter upload_streams=1

Just to be sure: You are running this on your laptop? And that laptop
has the ath10k and the modified kernel you are testing? Is 192.168.1.7
the AP or another device?

I'd like to see what happens when the link is fully saturated my
multiple streams as well. Could you repeat the tests with
upload_streams=5, please? And if you could share the .flent.gz files
(upload them somewhere, or email me off-list), that would be useful as
well :)

Thanks,

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
