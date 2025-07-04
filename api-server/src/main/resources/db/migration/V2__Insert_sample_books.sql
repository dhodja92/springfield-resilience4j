-- SQL script to insert 1000 random books
-- This script generates realistic book titles, ISBN values, and page counts

-- Using PostgreSQL's generate_series to create 1000 rows
INSERT INTO book (title, isbn, number_of_pages)
SELECT 
    CASE (random() * 20)::integer
        WHEN 0 THEN 'The Art of ' || 
            (ARRAY['Programming', 'Design', 'Writing', 'Leadership', 'Negotiation', 'Public Speaking', 
                  'Data Science', 'Machine Learning', 'Photography', 'Cooking'])[1 + (random() * 9)::integer]
        WHEN 1 THEN 'A History of ' || 
            (ARRAY['Ancient Rome', 'Medieval Europe', 'The Renaissance', 'The Industrial Revolution', 
                  'Modern China', 'The Cold War', 'The American West', 'World War II', 
                  'The Space Race', 'The Digital Age'])[1 + (random() * 9)::integer]
        WHEN 2 THEN 
            (ARRAY['The', 'A', 'My'])[1 + (random() * 2)::integer] || ' ' ||
            (ARRAY['Secret', 'Lost', 'Hidden', 'Forgotten', 'Mysterious', 'Ancient', 'Eternal', 
                  'Invisible', 'Silent', 'Broken'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Garden', 'Library', 'City', 'Kingdom', 'Journey', 'Symphony', 'Portrait', 
                  'Memory', 'Promise', 'Legacy'])[1 + (random() * 9)::integer]
        WHEN 3 THEN 
            (ARRAY['How to', 'Learning to', 'Mastering', 'The Complete Guide to', 'Principles of', 
                  'Understanding', 'Exploring', 'Discovering', 'Practical', 'Essential'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Cook', 'Code', 'Draw', 'Invest', 'Meditate', 'Negotiate', 'Lead', 'Write', 
                  'Speak', 'Think Critically'])[1 + (random() * 9)::integer]
        WHEN 4 THEN 
            (ARRAY['The Last', 'The First', 'The Only', 'The Great', 'The Perfect', 'The Impossible', 
                  'The Unexpected', 'The Reluctant', 'The Accidental', 'The Immortal'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Detective', 'Astronaut', 'Wizard', 'Princess', 'Hero', 'Villain', 'Warrior', 
                  'Poet', 'Scientist', 'Traveler'])[1 + (random() * 9)::integer]
        WHEN 5 THEN 
            (ARRAY['Beyond the', 'Under the', 'Through the', 'After the', 'Before the', 'Inside the', 
                  'Outside the', 'Between the', 'Beneath the', 'Above the'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Horizon', 'Stars', 'Mountains', 'Ocean', 'Forest', 'Desert', 'Storm', 
                  'Shadows', 'Clouds', 'Veil'])[1 + (random() * 9)::integer]
        WHEN 6 THEN 
            (ARRAY['Modern', 'Advanced', 'Fundamental', 'Theoretical', 'Applied', 'Computational', 
                  'Organic', 'Quantum', 'Molecular', 'Cognitive'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Physics', 'Chemistry', 'Biology', 'Mathematics', 'Economics', 'Psychology', 
                  'Sociology', 'Linguistics', 'Philosophy', 'Engineering'])[1 + (random() * 9)::integer]
        WHEN 7 THEN 
            (ARRAY['Summer', 'Winter', 'Spring', 'Autumn', 'Midnight', 'Dawn', 'Dusk', 
                  'Twilight', 'Moonlight', 'Sunlight'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Dreams', 'Whispers', 'Secrets', 'Memories', 'Shadows', 'Echoes', 'Reflections', 
                  'Illusions', 'Promises', 'Wishes'])[1 + (random() * 9)::integer]
        WHEN 8 THEN 
            (ARRAY['The', 'A'])[1 + (random() * 1)::integer] || ' ' ||
            (ARRAY['Subtle', 'Hidden', 'Unexpected', 'Remarkable', 'Curious', 'Strange', 'Elegant', 
                  'Brilliant', 'Profound', 'Delicate'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Art', 'Science', 'Theory', 'Practice', 'Language', 'Craft', 'Technique', 
                  'Method', 'Approach', 'Perspective'])[1 + (random() * 9)::integer] || ' of ' ||
            (ARRAY['Persuasion', 'Innovation', 'Creativity', 'Problem Solving', 'Decision Making', 
                  'Communication', 'Leadership', 'Strategy', 'Negotiation', 'Critical Thinking'])[1 + (random() * 9)::integer]
        WHEN 9 THEN 
            (ARRAY['Life and Times of', 'Autobiography of', 'Biography of', 'Memoirs of', 'Confessions of', 
                  'Reflections of', 'Letters from', 'Journals of', 'Diaries of', 'Recollections of'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Alexander', 'Elizabeth', 'Benjamin', 'Catherine', 'David', 'Eleanor', 'Frederick', 
                  'Gabriella', 'Henry', 'Isabella'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Miller', 'Davis', 
                  'Garcia', 'Rodriguez', 'Wilson'])[1 + (random() * 9)::integer]
        WHEN 10 THEN 
            (ARRAY['The Rise and Fall of', 'The Making of', 'The Transformation of', 'The Evolution of', 
                  'The Discovery of', 'The Invention of', 'The Development of', 'The Creation of', 
                  'The Birth of', 'The Death of'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Modern Society', 'The Internet', 'Democracy', 'Capitalism', 'The Roman Empire', 
                  'The Soviet Union', 'The British Empire', 'The American Dream', 'Silicon Valley', 'Wall Street'])[1 + (random() * 9)::integer]
        WHEN 11 THEN 
            (ARRAY['Artificial Intelligence', 'Blockchain Technology', 'Quantum Computing', 'Renewable Energy', 
                  'Genetic Engineering', 'Virtual Reality', 'Augmented Reality', 'Internet of Things', 
                  'Cloud Computing', 'Big Data Analytics'])[1 + (random() * 9)::integer] || ': ' ||
            (ARRAY['The Future of Technology', 'Challenges and Opportunities', 'A Practical Guide', 
                  'Theory and Practice', 'Principles and Applications', 'A Comprehensive Introduction', 
                  'Advanced Concepts', 'Emerging Trends', 'Case Studies', 'Ethical Considerations'])[1 + (random() * 9)::integer]
        WHEN 12 THEN 
            (ARRAY['The Psychology of', 'The Philosophy of', 'The Science of', 'The Politics of', 
                  'The Economics of', 'The Sociology of', 'The Anthropology of', 'The History of', 
                  'The Ethics of', 'The Mathematics of'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Happiness', 'Success', 'Love', 'Power', 'Money', 'Religion', 'War', 
                  'Peace', 'Justice', 'Freedom'])[1 + (random() * 9)::integer]
        WHEN 13 THEN 
            (ARRAY['Cooking', 'Gardening', 'Painting', 'Photography', 'Woodworking', 'Knitting', 
                  'Pottery', 'Calligraphy', 'Origami', 'Baking'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['for Beginners', 'for Dummies', 'Made Easy', 'for Professionals', 'Masterclass', 
                  '101', 'Essentials', 'Techniques', 'Projects', 'Inspirations'])[1 + (random() * 9)::integer]
        WHEN 14 THEN 
            (ARRAY['The Girl', 'The Boy', 'The Man', 'The Woman', 'The Child', 'The Stranger', 
                  'The Neighbor', 'The Friend', 'The Enemy', 'The Lover'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['with the Dragon Tattoo', 'in the Ice Castle', 'from the Other Side', 'who Knew Too Much', 
                  'with the Golden Eye', 'on the Train', 'in Room 13', 'under the Stairs', 
                  'behind the Mask', 'without a Name'])[1 + (random() * 9)::integer]
        WHEN 15 THEN 
            (ARRAY['Harry Potter', 'Percy Jackson', 'Sherlock Holmes', 'James Bond', 'Hercule Poirot', 
                  'Miss Marple', 'Jack Ryan', 'Jason Bourne', 'Katniss Everdeen', 'Frodo Baggins'])[1 + (random() * 9)::integer] || ' and the ' ||
            (ARRAY['Philosopher''s Stone', 'Chamber of Secrets', 'Prisoner of Azkaban', 'Goblet of Fire', 
                  'Order of the Phoenix', 'Half-Blood Prince', 'Deathly Hallows', 'Cursed Child', 
                  'Lost City', 'Final Challenge'])[1 + (random() * 9)::integer]
        WHEN 16 THEN 
            (ARRAY['Pride and Prejudice', 'Sense and Sensibility', 'War and Peace', 'Crime and Punishment', 
                  'Love and Hate', 'Life and Death', 'Truth and Lies', 'Hope and Despair', 
                  'Past and Future', 'Heaven and Hell'])[1 + (random() * 9)::integer] || ' in ' ||
            (ARRAY['Modern America', 'Victorian England', 'Ancient Greece', 'Revolutionary France', 
                  'Imperial China', 'Soviet Russia', 'Medieval Europe', 'Colonial Africa', 
                  'Feudal Japan', 'Contemporary Society'])[1 + (random() * 9)::integer]
        WHEN 17 THEN 
            (ARRAY['The', 'A'])[1 + (random() * 1)::integer] || ' ' ||
            (ARRAY['Definitive', 'Complete', 'Essential', 'Comprehensive', 'Ultimate', 'Practical', 
                  'Illustrated', 'Advanced', 'Beginner''s', 'Professional'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Guide', 'Handbook', 'Manual', 'Companion', 'Reference', 'Encyclopedia', 
                  'Dictionary', 'Anthology', 'Collection', 'Compendium'])[1 + (random() * 9)::integer] || ' to ' ||
            (ARRAY['Web Development', 'Digital Marketing', 'Project Management', 'Data Analysis', 
                  'Machine Learning', 'Cybersecurity', 'Cloud Computing', 'Mobile App Development', 
                  'Game Design', 'User Experience'])[1 + (random() * 9)::integer]
        WHEN 18 THEN 
            (ARRAY['The', 'A'])[1 + (random() * 1)::integer] || ' ' ||
            (ARRAY['Red', 'Blue', 'Green', 'Black', 'White', 'Golden', 'Silver', 'Crystal', 
                  'Emerald', 'Ruby'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Dragon', 'Phoenix', 'Lion', 'Tiger', 'Eagle', 'Wolf', 'Serpent', 
                  'Unicorn', 'Griffin', 'Mermaid'])[1 + (random() * 9)::integer] || ' of ' ||
            (ARRAY['Avalon', 'Narnia', 'Westeros', 'Middle-earth', 'Hogwarts', 'Asgard', 
                  'Atlantis', 'Olympus', 'Camelot', 'Eldorado'])[1 + (random() * 9)::integer]
        ELSE 
            (ARRAY['The', 'A'])[1 + (random() * 1)::integer] || ' ' ||
            (ARRAY['Silent', 'Invisible', 'Forgotten', 'Hidden', 'Secret', 'Lost', 'Eternal', 
                  'Ancient', 'Mysterious', 'Sacred'])[1 + (random() * 9)::integer] || ' ' ||
            (ARRAY['Song', 'Dance', 'Poem', 'Story', 'Tale', 'Legend', 'Myth', 
                  'Fable', 'Saga', 'Epic'])[1 + (random() * 9)::integer] || ' of ' ||
            (ARRAY['Love', 'War', 'Peace', 'Time', 'Space', 'Life', 'Death', 
                  'Dreams', 'Memories', 'Destiny'])[1 + (random() * 9)::integer]
    END,
    -- Generate ISBN-13 format: 978-XXXX-XXXX-X where X are random digits
    '978-' || 
    (random() * 9000 + 1000)::integer || '-' || 
    (random() * 9000 + 1000)::integer || '-' || 
    (random() * 9)::integer,
    -- Generate a reasonable number of pages between 50 and 1200
    (random() * 1150 + 50)::integer
FROM generate_series(1, 1000);