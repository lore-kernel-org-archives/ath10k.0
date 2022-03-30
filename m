Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E1C433F5
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74Yj/f4Yhz7wD4g35zF6eD9YxXIGqnJ1cMNuBnbCuWk=; b=s8VGgFg3PDfTwY
	tyiNpWsLQpG4l0TTk6gl0uQIBWAuHhWr1GmEc+nXipOsQbPVEwot6oQVO0QkWVbyH1V/wX2q4y+2a
	tE//boB0h65cSW6Wa7dcqMwS1zZ+VxectjtK9yDuuTs1roQaboEodpz/t51Kkt7h1TJno1LjqyPsW
	v/97kEKNVH10qwZ6khndYC/irw/IgHZPzG0DLii0epgkR1SuInAvfzW9XIeL6yexiCLIz9hkEtrq3
	VvrT1HhGeLz30psfFfYdujgsHyF323YNKP4PsmM+CPXyIXI3HcB8KE+q8fZf7YI9gigYSDNZpOquE
	+iXGsBUANvHGBLKvxeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQzg-00EM9h-OG; Wed, 30 Mar 2022 05:35:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZQzd-00EM8o-Kf
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 05:35:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84F09615AE;
 Wed, 30 Mar 2022 05:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D9DC340EC;
 Wed, 30 Mar 2022 05:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648618539;
 bh=TWVPJfY5eyKwBexepSodh8rgKJMsyWSpBXPJjSDi398=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=aDNuRbuqqyWc4lemm8RsnNQeJouNvC3oVxjZEYiCweSzb/bwBDcmohWU6OOEaq27/
 fIY50FCwcbj7wSxyix5owQ95FCxP/BavKXclz2L536tluUcd1RyFdopHRiX7tNR8lK
 ldtqvPHw/1Ys7nsPqoPuOZg+BUPxcZzC3U7I0uiqaBq+UF18l+5gQjKbF2ttW9NJ5u
 qxesyrL0xgHr/8S2ZEdVL8enOVlNQJicCycwwI2Y53hnaUPmVB1xMH3+l9sM5o/uMy
 OwfofbKvruuInvtgHUJ8OI/KXtZe3DjhOCgnkXkyMN9/PVw58hJACosQtKwJm2hVcq
 1C1wbc+v1MAmg==
From: Kalle Valo <kvalo@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: ALSI@bang-olufsen.dk, Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Julian Calaby <julian.calaby@gmail.com>,
 svp <svpm@yandex.ru>, Massimo Maggi <me@massimo-maggi.eu>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
References: <YSJ//ki/A1EgfLga@skv.local>
 <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
 <YSQC32TygIq2SHJR@skv.local>
 <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
 <4c44fdc2-8dde-8a98-8dd4-4b7e6b57a090@bang-olufsen.dk>
 <CA+ASDXOeC+S2d7g0b=aS_q9XxNtdayF1S5XE9T85NZrxXnK5KA@mail.gmail.com>
Date: Wed, 30 Mar 2022 08:35:34 +0300
In-Reply-To: <CA+ASDXOeC+S2d7g0b=aS_q9XxNtdayF1S5XE9T85NZrxXnK5KA@mail.gmail.com>
 (Brian Norris's message of "Tue, 29 Mar 2022 14:06:40 -0700")
Message-ID: <8735j0xas9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_223542_127253_D9AB3DED 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> Side note: it's a small shame that Kalle's scripts seem to have munged
> the authorship date -- git thinks it was authored in 2022, when in
> fact it was in 2020 ;)

Oops, sorry about that. I use stgit and then I edited the commit log to
add the Link tag, it must have changed the date.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
